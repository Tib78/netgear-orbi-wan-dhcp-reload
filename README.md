# netgear-orbi-wan-dhcp-reload

Ce script permet de corriger le problème de perte de connexion présent sur les routeurs Orbi en mode routeur et connectés sans livebox (via un module SFP ou ONT) avec le paramètre "DHCP Orange".

Le problème se manifeste par une perte de connectivité internet aléatoire et les adresses IP/masque/passerelle WAN sont à zéro dans l'interface du routeur.

Le script recharge automatiquement la connexion sur votre routeur sans le redémarrer et permet donc de maintenir une connectivité normale.

Il fonctionne sous Linux/Mac OS et doit être lancer via un cron ou un démon launchd si vous souhaitez automatiser le traitement pour lancer le script quotidiennement par exemple.

## Installation 

- Avant de lancer le script, renseignez votre login, votre mot de passe et votre fti (la partie après le / uniquement).
- Une fois vos informations renseignées, le script est directement testable avec la commande (pensez à rendre le script executable si nécessaire avec 'chmod +x') :
  `./reloadWanDHCP_generic.sh`

Si vous souhaitez automatiser le lancement du script, vous pouvez ajouter celui-ci dans crontab :

- `crontab -e`
- Ajoutez la ligne suivante pour un lancement tous les jours à 3h00 : `0 3 * * * /path/to/reloadWanDHCP_generic.sh`

Pour les utilisateurs MacOS vous pouvez utiliser launchd qui est l'utilitaire officiel :

- Ajoutez le fichier plist fourni dans le répertoire suivant : `/Library/LaunchDaemons/`
- Editez le fichier pour mettre à jour le chemin du script.
- Chargez le démon avec la commande suivante :

 `sudo launchctl load -w /Library/LaunchDaemons/com.startup.dhcp.plist`
 
Pour vérifier que le script fonctionne bien il suffit de se rendre dans l'onglet Avancé -> Afficher les statistiques puis vérifier le temps de disponibilité, il doit remonter au dernier lancement du script.

A noter : 

- Ce script a été testé avec succès avec le routeur Orbi RBR850 en mode routeur (firmware V3.2.18.1_1.4.14) avec la connexion WAN en mode DHCP Orange et un module TP-LINK MC220L.
- Il est utile de préciser que ce problème concerne uniquement les personnes qui souhaitent bypasser leur livebox avec un Orbi, si vous mettez votre Orbi derrière une Livebox en mode AP, vous n'aurez pas ce problème.
