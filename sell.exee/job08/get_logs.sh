utilisateur="said"

fichier_logs="/var/log/lastlog"

nombre_connexions=$(grep "sshd.*Accepted.*$utilisateur" "$fichier_logs" | wc -l)

date_format=$(date +"%d-%m-%Y-%H:%M")

nom_fichier="number_connection-$date_format"

echo "$nombre_connexions" > "$nom_fichier"

tar -cvf "$nom_fichier.tar" "$nom_fichier"

mkdir -p ~/Job8:Backup
mv "$nom_fichier.tar" ~/Job8:Backup/

rm "$nom_fichier"

