echo "Mise à jour du gestionnaire de paquets en cours..."
apt update

echo "Mise à jour des paquets installés en cours..."
apt upgrade -y

echo "Nettoyage des paquets obsolètes en cours..."
apt autoremove -y
apt clean

echo "Mise à jour terminée."
