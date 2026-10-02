#
 Évaluation DICP appliquée à Git

 Critère  Git le garantit ?  Preuve tirée du TP (commande + observation)  Ce qu'il faut ajouter 
 :---  :---  :---  :--- 
 **Disponibilité**  **Oui**  git clone tp3-dicp tp3-sauvegarde<br>Après suppression du dossier avec rm -rf tp3-dicp, le clone a permis de tout restaurer à l'identique avec l'historique complet.  Une politique de sauvegarde externe automatisée pour les données non commitées et éviter les suppressions propagées (git push --force). 
 **Intégrité**  **Oui**  git hash-object virement.txt puis git cat-file -p HEAD<br>La modification d'un seul caractère change totalement l'empreinte (effet avalanche), et le lien parent enchaîne l'historique.  Un contrôle d'intégrité externe en cas de corruption de disque sans copie locale (git fsck). 
 **Confidentialité**  **Non**  git show HEAD:config.env<br>Lecture directe du mot de passe de production en clair, sans aucune demande d'authentification ou de mot de passe.  Un chiffrement des données sensibles applicatives (AES), la gestion des secrets hors-dépôt (.gitignore) et un contrôle d'accès sur la forge distante. 
 **Preuve**  **Partiellement**  git commit --author="Directeur Financier <dfmycallcenter.fr>"<br>Le commit a été enregistré sous le nom du directeur sans vérification d'identité ni mot de passe.  La signature cryptographique obligatoire des commits avec des clés privées RSA/GPG (git commit -S). 

---

#
#
 Conclusion au DPO

La phrase  Mesure de sécurité : les données sont versionnées dans Git  est insuffisante pour le registre de traitement. Git assure l'intégrité (hachage chaîné) et la disponibilité (copies décentralisées), mais n'offre aucune confidentialité (données en clair) ni non-répudiation (identités de commit falsifiables).
Il convient d'écrire à la place :  Les données sont versionnées sous Git avec signature GPG obligatoire des commits, hébergées sur un dépôt privé à accès restreint, et les secrets sont chiffrés hors dépôt. 
