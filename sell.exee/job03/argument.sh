nouveau_fichier="$1"
fichier_source="$2"

if [ ! -e "$fichier_source" ]; then
  echo "Le fichier source '$fichier_source' n'existe pas."
  exit 1
fi

cat "$fichier_source" > "$nouveau_fichier"

if [ $? -eq 0 ]; then
  echo "Le contenu de '$fichier_source' a été copié dans '$nouveau_fichier'."
else
  echo "Une erreur s'est produite lors de la copie du contenu de '$fichier_source' dans '$nouveau_fichier'."
fi
