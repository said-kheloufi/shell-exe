logs_dir="/var/log"

utilisateur="said"

output_file="~/Job8:Backup/number_connection-$(date +'%d-%m-%Y-%H:%M').tar"

nombre_connexions=$(grep -c "$utilisateur" "$logs_dir/auth.log")

echo "$nombre_connexions" > "$output_file"

tar -cvf "$output_file.tar" "$output_file"

mv "$output_file.tar" ~/Job8:Backup/

echo "Le script a été exécuté à $(date +'%d-%m-%Y %H:%M') et le nombre de connexions de $utilisateur a été enregistré dans $output_file.tar."
