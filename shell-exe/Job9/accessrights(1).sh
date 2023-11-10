if ! grep -q '^User:' /etc/group; then
  sudo groupadd User
echo "le groupe a ete cree"
fi

if ! grep -q '^Admin:' /etc/group; then
  sudo groupadd Admin
echo "le group a ete cree"
fi

fichier_csv="Shell_Userlist.csv"

if [ ! -f "$fichier_csv" ]; then
  echo "Le fichier CSV \"$fichier_csv\" n'existe pas."
  exit 1
fi

while IFS=',' read -r Id Prenom Nom Mdp Role
do
nom_utilisateur="$Prenom$Nom"

  # Supprime les espaces avant et après le prénom
  Prenom=$(echo "$Prenom" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  # Affiche les données lues depuis le fichier CSV pour le débogage
  echo "Id: $Id, Prenom: \"$Prenom\", Nom: \"$Nom\", Mdp: \"$Mdp\", Role: \"$Role\""


if [ "$Role" == "User" ]; then
      sudo useradd -m -p "$Mdp" -c "$Prenom $Nom" -G User "$nom_utilisateur"
      echo "L'utilisateur \"$nom_utilisateur\" a été créé avec succès en tant qu'utilisateur."
    elif [ "$Role" == "Admin" ]; then
      sudo useradd -m -p "$Mdp" -c "$Prenom $Nom" -G Admin "$nom_utilisateur"
      echo "L'utilisateur \"$nom_utilisateur\" a été créé avec succès en tant qu'administrateur."
   else

 sudo useradd -m -p "$Mdp" -c "$Prenom $Nom" -G "$Role" "$nom_utilisateur"
    echo "L'utilisateur \"$nom_utilisateur\" a été créé avec succès avec le role\"$Role"
  fi
done < "$fichier_csv"
