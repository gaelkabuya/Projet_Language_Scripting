#!/bin/bash
# Récupérer les informations de chaque processus en cours d'exécution
processus=$(ps -eo pid,pcpu,args --sort=-pcpu)
# Parcourir chaque ligne de la sortie de la commande "ps"
while read -r line; do
# Récupérer le taux d'utilisation CPU du processus
cpu_usage=$(echo "$line" | awk '{print $2}')
# Vérifier si le taux d'utilisation CPU est supérieur à 5%
if (( $(echo "$cpu_usage > 5.0" | bc -l) )); then
# Afficher le processus et son taux d'utilisation CPU
echo "$line"
fi
done <<< "$processus"