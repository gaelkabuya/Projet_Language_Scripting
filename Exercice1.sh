#!/bin/bash
# on crée une fonction copie
if [ $# -ne 2 ]
then
echo "Erreur : Nombre d’arguments incorrect"
exit 1
fi
if [ ! -r $1 ]
then
echo "Erreur : la source n'est pas accessible"
exit 2
fi
if [ ! -f $1 ]
then
echo "Erreur : la source n'est pas un fichier"
exit 3
fi
if [ ! -e $2 ]
then
echo "Erreur : la destination n'existe pas"
exit 4
fi
rep_dst=`dirname $2`
if [ -w $rep_dst ]
then
echo "Erreur : le répertoire n'est pas accessible"
exit 5
fi
if cp $1 $2 > /dev/null
then :
else
echo "Erreur : la copie a echouée"
exit 6
fi
source=$1
destination=$2
cp $source $destination
echo "Le contenu du fichier $source a bien été copié vers $destination."