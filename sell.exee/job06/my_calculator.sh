nombre1="$1"
operateur="$2"
nombre2="$3"

case "$operateur" in
  "+")
    resultat=$(bc <<< "$nombre1 + $nombre2")
    ;;
  "-")
    resultat=$(bc <<< "$nombre1 - $nombre2")
    ;;
  "*")
    resultat=$(bc <<< "$nombre1 * $nombre2")
    ;;
  "/")
    if [ "$nombre2" = "0" ]; then
      echo "Erreur : Division par zéro."
      exit 1
    fi
    resultat=$(bc <<< "$nombre1 / $nombre2")
    ;;
  *)
    echo "Opérateur non pris en charge. Utilisez '+', '-', '*', ou '/'."
    exit 1
    ;;
esac

echo "Résultat de $nombre1 $operateur $nombre2 = $resultat"
