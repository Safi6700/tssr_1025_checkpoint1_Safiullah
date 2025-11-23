#!/bin/bash


# les arguments compte créer

# Vérification de la présence d'arguments
if [ $# -eq 0 ] 
	then 
	echo "il manque les nom d'utilisateurs en argument =< fin du script =>"
	exit 1

	else
		while [ $# -gt 0 ]
			do	

				# Vérification existence utilisateur sur le système
				grep "$1" /etc/passwd > /dev/null
				if [ $? -eq 0 ]
					then 
					# - Si le compte existe déjà
					#            pas de création
					#            message "le compte existe déjà"
						echo "Le compte $1 existe déjà sur le système"
					else 
					# Si le compte n'existe pas
								# création du compte
								# Créer compte utilisateur
								useradd "$1" > /dev/null
								# Vérification si le compte a été crée
								if [ $? -eq 0 ]
									then 
									# - Si le compte a bien été crée
										#             message "le compte a bien été crée"
										echo "Le compte $1 a bien été crée"
									else
									# - Si le compte n'existe pas
										#             message "le compte n'a pas été crée"
										echo "Erreur à la création de l'utilisateur $1"
								fi

				fi
			# on passe au argument suivant
			shift 

		done
fi
echo "Fin du screipt"