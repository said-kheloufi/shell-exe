fichier_csv="Shell_Userlist.csv"

if [ ! -f "$fichier_csv" ]; then
  echo "Le fichier CSV \"$fichier_csv\" n'existe pas."
  exit 1
fi

while IFS=',' read -r Id Prenom Nom Mdp Role
do
nom_utilisateur="$Prenom$Nom"
if id "$nom_utilisateur" &>/dev/null; then
    echo "L'utilisateur \"$nom_utilisateur\" existe déjà."
  else

 sudo useradd -m -p "$Mdp" -c "$Prenom $Nom" "$nom_utilisateur"
    echo "L'utilisateur \"$nom_utilisateur\" a été créé avec succès."
  fi
done < "$fichier_csv"
