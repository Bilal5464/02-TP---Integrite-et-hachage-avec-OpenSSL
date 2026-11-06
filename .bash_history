git log --oneline
git ls-files
cat config/.env
git log --diff-filter=A --name-only --pretty=format:''
git log --pretty=format:'%h | %an | %ad | %s' --date=short
git show 7917ebb
clear
git log --oneline -S "num_secu"
git log --oneline -S "DB_PASSWORD"
git show 7917ebb:data/export-clients.csv
cat data/jeu-de-test.csv
ls data/
git log --oneline --full-history -- data/export-clients.csv
git show 7917ebb:data/export-clients.csv > ~/fuite-recuperee.csv
wc -l ~/fuite-recuperee.csv
rm ~/fuite-recuperee.csv
rm ~/fuite-recuperee.csv
rm -f ~/fuite-recuperee.csv /p/fuite-recuperee.csv fuite-recuperee.csv
echo ".env" > .gitignore && echo "config/.env" >> .gitignore && echo "data/export-*.csv" >> .gitignore && echo "*.dump" >> .gitignore
cat .gitignore
git rm --cached config/.env
git add .gitignore
git commit -m "Ajoute un .gitignore et retire les secrets du suivi"
git status
echo "nom;email" > data/export-clients.csv
git status
git log --oneline -S "DB_PASSWORD"
cd ~/Documents
mkdir -p bloc3-cyber/tp1-rgpd
cd bloc3-cyber
git init
git branch -M main
git remote add origin https://github.com/VOTRE-USERNAME/bloc3-cyber.git
cd tp1-rgpd
cd ~/Documents
mkdir -p bloc3-cyber/tp1-rgpd
cd bloc3-cyber
git init
git branch -M main
git remote add origin https://github.com/VOTRE-USERNAME/bloc3-cyber.git
mkdir -p tp1-rgpd && cd tp1-rgpd
cat << 'EOF' > classification.csv
colonne;categorie;justification
id;NP;Identifiant technique interne ne permettant pas d'identifier un individu seul.
nom, prenom;DIR;Identifie directement la personne physique de maniere explicite.
email;DIR;Permet d'identifier ou de contacter directement l'individu.
code_postal;IND;Permet de geolocaliser indirectement un individu en croisant avec d'autres donnees.
ip_connexion;IND;Adresse IP tracable permettant d'identifier indirectement un utilisateur.
id_cookie;IND;Identifiant unique de tracage permettant de reconnaitre indirectement un profil.
num_secu;SENS;Donnee de sante / identifiant national unique hautement critique (Art. 9).
carte_bancaire;IND;Donnee financiere hautement confidentielle rattachee a un titulaire.
commentaire_libre;SENS;Revele des donnees sensibles (sante/handicap, opinions syndicales, religion).
EOF

cat << 'EOF' > rapport-audit.md
# Rapport d'Audit de Sécurité - Dépôt MyCom

## 1. Origine de la fuite
L'audit a révélé l'introduction d'un fichier contenant des données personnelles (`data/export-clients.csv`) lors d'un commit de test. L'auteur est Karim Bouaziz. Un commit ultérieur prétendant retirer les données réelles suite à l'alerte du DPO s'est contenté de supprimer le fichier du dossier de travail.

## 2. Analyse des vulnérabilités
- **Données personnelles** : Le fichier reste accessible dans l'historique Git et contient des données d'identification directe, indirecte et sensibles (Art. 9 RGPD : santé, syndicat, religion).
- **Secrets techniques** : Le fichier `config/.env` contient des identifiants de base de données, SMTP et jeton d'API lisibles en clair dans l'historique.

## 3. Limites du nettoyage et conformité RGPD
Un simple `git rm` ne répond pas à l'Art. 17 du RGPD (droit à l'effacement). Pour purger les données, une réécriture d'historique (`git filter-repo`) est obligatoire. Le message de suppression était trompeur car la fuite restait exploitable.

## 4. Mesures correctives
- **Protection future** : Ajout d'un fichier `.gitignore` ciblant `.env` et `data/export-*.csv`.
- **Gestion des secrets** : Les identifiants ayant été poussés, la base de données est compromise. La seule solution est la rotation immédiate du mot de passe.
EOF

ls -la
cat classification.csv
cat rapport-audit.md
cd ..
git add .
git commit -m "TP1 : audit RGPD du depot MyCom"
git push -u origin main
git remote set-url origin https://github.com/Bilal5464/bloc3-cyber.git
git push -u origin main
git push -u origin main
[200~cd "$(cygpath -u "$USERPROFILE")/Desktop"
pwd
mkdir -p bloc3-sio1
cd bloc3-sio1
mkdir tp3-dicp
cd tp3-dicp
git init
git config user.name "Lea Moreau"
git config user.email "l.moreaumycallcenter.fr"
echo "Virement de 1000 euros vers FR76 3000 1007 9412 3456 7890 185" > virement.txt
git add virement.txt
git commit -m "Enregistre l'ordre de virement fournisseur"
echo 'DB_PASSWORD=Etude2026!prod' > config.env
git add config.env
git commit -m "Ajoute la configuration de la base"
[200~# 1.1 Empreintes
git hash-object virement.txt
echo "Virement de 1000 euros vers FR76 3000 1007 9412 3456 7890 186" > virement.txt
git hash-object virement.txt
echo "Virement de 1000 euros vers FR76 3000 1007 9412 3456 7890 185" > virement.txt
#
 1.2 Inspection du commit
git cat-file -p HEAD
git log --oneline
cd ..
git clone tp3-dicp tp3-sauvegarde
cd tp3-sauvegarde
git log --oneline
cd ..
rm -rf tp3-dicp
ls
git clone tp3-sauvegarde tp3-dicp
cd tp3-dicp
git log --oneline
cat virement.txt
cd ../tp3-sauvegarde
git log --oneline
cat config.env
git show HEAD:config.env
cd ../tp3-dicp
git log --pretty=format:'%h | %an <%ae> | %ad | %s' --date=iso
echo "Nouvelle regle virements valides sans double controle" > procedure.txt
git add procedure.txt
git commit -m "Valide la nouvelle procedure de virement" --author="Directeur Financier <df@mycallcenter.fr>"
git log -1
git log -1 --pretty=format:'auteur=%an | committer=%cn'
[200~cd ../tp3-sauvegarde
git log --oneline
cd ../tp3-dicp
git log --pretty=format:'%h | %an <%ae> | %ad | %s' --date=iso
echo "Nouvelle regle virements valides sans double controle" > procedure.txt
git add procedure.txt
git commit -m "Valide la nouvelle procedure de virement" --author="Directeur Financier <df@mycallcenter.fr>"
git log -1
git log -1 --pretty=format:'auteur=%an | committer=%cn'
cd ../bloc3-cyber
mkdir -p tp3-dicp
cat << 'EOF' > tp3-dicp/grille-dicp-git.md
# Évaluation DICP appliquée à Git

| Critère | Git le garantit ? | Preuve tirée du TP (commande + observation) | Ce qu'il faut ajouter |
| :--- | :--- | :--- | :--- |
| **Disponibilité** | **Oui** | `git clone tp3-dicp tp3-sauvegarde`<br>Après suppression du dossier avec `rm -rf tp3-dicp`, le clone a permis de tout restaurer à l'identique avec l'historique complet. | Une politique de sauvegarde externe automatisée pour les données non commitées et éviter les suppressions propagées (`git push --force`). |
| **Intégrité** | **Oui** | `git hash-object virement.txt` puis `git cat-file -p HEAD`<br>La modification d'un seul caractère change totalement l'empreinte (effet avalanche), et le lien `parent` enchaîne l'historique. | Un contrôle d'intégrité externe en cas de corruption de disque sans copie locale (`git fsck`). |
| **Confidentialité** | **Non** | `git show HEAD:config.env`<br>Lecture directe du mot de passe de production en clair, sans aucune demande d'authentification ou de mot de passe. | Un chiffrement des données sensibles applicatives (AES), la gestion des secrets hors-dépôt (`.gitignore`) et un contrôle d'accès sur la forge distante. |
| **Preuve** | **Partiellement** | `git commit --author="Directeur Financier <df@mycallcenter.fr>"`<br>Le commit a été enregistré sous le nom du directeur sans vérification d'identité ni mot de passe. | La signature cryptographique obligatoire des commits avec des clés privées RSA/GPG (`git commit -S`). |

---

## Conclusion au DPO

La phrase « Mesure de sécurité : les données sont versionnées dans Git » est insuffisante pour le registre de traitement. Git assure l'intégrité (hachage chaîné) et la disponibilité (copies décentralisées), mais n'offre aucune confidentialité (données en clair) ni non-répudiation (identités de commit falsifiables).
Il convient d'écrire à la place : « Les données sont versionnées sous Git avec signature GPG obligatoire des commits, hébergées sur un dépôt privé à accès restreint, et les secrets sont chiffrés hors dépôt. »
EOF

git add tp3-dicp
git commit -m "TP4: grille DICP appliquee a Git"
git push
ng objects: 100% (7/7), 1.76 KiB | 451.00 KiB/s, done.
Total 7 (delta 1), reused 0 (delta 0), pack-reused 0 (from 0)
remote: error: refusing to update checked out branch: refs/heads/main
remote: error: By default, updating the current branch in a non-bare repository
remote: is denied, because it will make the index and work tree inconsistent
remote: with what you pushed, and will require 'git reset --hard' to match
remote: the work tree to HEAD.
remote:
remote: You can set the 'receive.denyCurrentBranch' configuration variable
remote: to 'ignore' or 'warn' in the remote repository to allow pushing into
remote: its current branch; however, this is not recommended unless you
remote: arranged to update its work tree to match what you pushed in some
remote: other way.
remote:
remote: To squelch this message and still keep the default behaviour, set
remote: 'receive.denyCurrentBranch' configuration variable to 'refuse'.
To //SRV-AD-01/Perso_Etudiants/babdelghani/bloc3-sio1/tp3-sauvegarde
 ! [remote rejected] main -> main (branch is currently checked out)
error: failed to push some refs to '//SRV-AD-01/Perso_Etudiants/babdelghani/bloc3-sio1/tp3-sauvegarde'
Babdelghani@BJ05_PC-01 MINGW64 /p/bloc3-sio1/tp3-dicp (main)
$
[200~# 1. Se placer dans le dossier racine
cd /p/
#
 2. Créer le dossier du rendu dans bloc3-cyber
mkdir -p bloc3-cyber/tp3-dicp
cd bloc3-cyber
#
 3. Écrire la grille directement dans le fichier
#echo '
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
Il convient d'écrire à la place :  Les données sont versionnées sous Git avec signature GPG obligatoire des commits, hébergées sur un dépôt privé à accès restreint, et les secrets sont chiffrés hors dépôt. ' > tp3-dicp/grille-dicp-git.md
#
 4. Valider le rendu
git add tp3-dicp
git commit -m "TP4: grille DICP appliquee a Git"
git push
[200~# 1. Se placer dans le dossier racine
cd /p/bloc3-cyber
#
 2. Écrire le contenu complet dans le fichier
cat << 'EOF' > tp3-dicp/grille-dicp-git.md
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
EOF

#
 3. Corriger le commit précédent et envoyer vers le serveur
git add tp3-dicp/grille-dicp-git.md
git commit --amend -m "TP4: grille DICP appliquee a Git"
git push
clear
cd /p/
rm -rf bloc3-cyber
mkdir -p bloc3-cyber/tp3-dicp
cd bloc3-cyber/tp3-dicp
git init
git config user.name "Lea Moreau"
git config user.email "l.moreau@mycallcenter.fr"
# Données de virement (Intégrité)
echo "Virement de 1000 euros vers FR76 3000 1007 9412 3456 7890 185" > virement.txt
git add virement.txt
git commit -m "Enregistre l'ordre de virement fournisseur"
# Secret en clair (Confidentialité non garantie)
git add config.env
git commit -m "Ajoute la configuration de la base"
# Falsification de l'auteur du commit (Non-répudiation non garantie)
echo "Nouvelle regle virements valides sans double controle" > procedure.txt
git add procedure.txt
git commit -m "Valide la nouvelle procedure de virement" --author="Directeur Financier <df@mycallcenter.fr>"
cat << 'EOF' > grille-dicp-git.md
# Évaluation DICP appliquée à Git

| Critère | Git le garantit ? | Preuve tirée du TP (commande + observation) | Ce qu'il faut ajouter |
| :--- | :--- | :--- | :--- |
| **Disponibilité** | **Oui** | `git clone tp3-dicp tp3-sauvegarde`<br>Après suppression avec `rm -rf`, le clone restaure l'historique complet. | Sauvegarde externe automatisée et protection contre `git push --force`. |
| **Intégrité** | **Oui** | `git hash-object virement.txt`<br>Chaque modification change totalement l'empreinte SHA-1 (effet avalanche). | Contrôle d'intégrité régulier avec `git fsck`. |
| **Confidentialité** | **Non** | `git show HEAD:config.env`<br>Lecture directe du mot de passe en clair sans restriction. | Chiffrement des secrets, utilisation de `.gitignore` et accès restreint au dépôt. |
| **Preuve** | **Partiellement** | `git commit --author="..."`<br>Création d'un commit sous l'identité du Directeur sans vérification. | Signature cryptographique obligatoire des commits avec clé GPG (`git commit -S`). |

---

## Conclusion au DPO

La phrase « Mesure de sécurité : les données sont versionnées dans Git » est insuffisante pour le registre de traitement. Git assure l'intégrité et la disponibilité, mais n'offre aucune confidentialité ni non-répudiation.
EOF

git add grille-dicp-git.md
git commit -m "TP3: Validation finale de la grille DICP"
git push
# 1. Créer config.env avec des guillemets simples (pour préserver le !)
echo 'DB_PASSWORD=Etude2026!prod' > config.env
git add config.env
git commit -m "Ajoute la configuration de la base"
# 1. Associer ton dépôt à GitHub
git remote add origin https://github.com/Bilal5464/01---TP3---Le-DICP-applique-a-Git.git
# 2. Renommer la branche principale en main et pousser le travail
git branch -M main
git push -u origin main
[200~cd "$(cygpath -u "$USERPROFILE")/Desktop"
git clone https://github.com/timotirob/bloc3-sio1-prerequis-tp5.git
cd bloc3-sio1-prerequis-tp5
[200~git shortlog -sne HEAD~
[200~cd "$(cygpath -u "$USERPROFILE")/Desktop"
git clone https://github.com/timotirob/bloc3-sio1-prerequis-tp5.git
cd bloc3-sio1-prerequis-tp5
cd "$(cygpath -u "$USERPROFILE")/Desktop"
git clone https://github.com/timotirob/bloc3-sio1-prerequis-tp5.git
cd bloc3-sio1-prerequis-tp5
bash scripts/approprier-le-depot.sh Bilal5464
git config --global user.name "Votre Nom"
git config --global user.email "votre-email@example.com"
git config --global user.name "AbdelGhani"
git config --global user.email "gilleli349@gmail.com"
bash scripts/approprier-le-depot.sh Bilal5464
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"~
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
git remote -v
git config user.name
git config user.email
git shortlog -sn HEAD
```[cite: 3]

Ces commandes vont vous afficher les détails nécessaires (dépôt distant, identité, auteurs et e-mails dans l'historique) pour remplir le tableau de l'étape 1 du TP[cite: 3].

git log --oneline -G "PASSWORD | TOKEN | SECRET|api_key|motdepasse"
cat .gitignore
git ls-files

git log --oneline -G "PASSWORD | TOKEN | SECRET|api_key|motdepasse"
cat .gitignore
git ls-files
git log --oneline -G "PASSWORD | TOKEN | SECRET|api_key|motdepasse"
cat .gitignore
git ls-files
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
mkdir -p tp5-risques
git add tp5-risques
git commit -m "TP5: analyse de risques de la chaine Git"
git push
[200~
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ git log --oneline -G "PASSWORD  TOKEN  SECRETapi_keymotdepasse"
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ cat .gitignore
#
 Dossiers des outils
.idea/
.vscode/
#
 Fichiers systeme Windows
Thumbs.db
desktop.ini
#
 Journaux et fichiers temporaires
*.log
*.tmp
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ git ls-files
.gitignore
LISEZ-MOI.md
MISE-A-NIVEAU.md
README.md
data/participants-atelier.csv
scripts/approprier-le-depot.sh
tp1-rgpd/rapport-audit.md
tp3-dicp/grille-dicp-git.md
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ ^C
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
mkdir -p tp5-risques
BabdelghaniBJ05_PC-02 MINGW64 /c/Users/Babdelghani/Desktop/bloc3-sio1/bloc3-cyber (main)
$ git add tp5-risques
git commit -m "TP5: analyse de risques de la chaine Git"
git push
Author identity unknown
*** Please tell me who you are.
Run
  git config --global user.email "youexample.com"
  git config --global user.name "Your Name"
to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <>) not allowed

[200~git config user.name "AbdelGhani"
git config user.email "gilleli349gmail.com"
git config user.name "AbdelGhani"
git config user.email "gilleli349@gmail.com"
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
git add tp5-risques
git commit -m "TP5: analyse de risques de la chaine Git"
git push
cd "$(cygpath -u "$USERPROFILE")/Desktop/bloc3-sio1/bloc3-cyber"
git remote set-url origin https://github.com/Bilal5464/Bloc-cyber-v2.git
git pull origin main --allow-unrelated-histories
git push -u origin main
[200~# ---------------------------------------------------------
#
 Partie 1 : Hacher un fichier et vérifier son intégrité
#
 ---------------------------------------------------------
#
 Étape 1 & 2 : Création du fichier et calcul du hachage SHA-256
echo "Les SIO sont drôlement sérieux et forts cette année." > messageAuxSIO.txt
openssl dgst -sha256 messageAuxSIO.txt
#
 Étape 3 : Sauvegarde de l'empreinte dans un fichier
openssl dgst -sha256 messageAuxSIO.txt > hashSIO.txt

#
 Étape 4 : Vérification d'intégrité (simulation échange binôme)
openssl dgst -sha256 messageAuxSIO.txt > verif_hashSIO.txt
diff hashSIO.txt verif_hashSIO.txt && echo "INTACT"  echo "ALTERE"
#
 ---------------------------------------------------------
#
 Exercice 1 : L'effet d'avalanche
#
 ---------------------------------------------------------
echo -n "Bonjour"  openssl dgst -sha256
echo -n "bonjour"  openssl dgst -sha256
#
 ---------------------------------------------------------
#
 Exercice 2 : La longueur fixe
#
 ---------------------------------------------------------
echo -n "ok"  openssl dgst -sha256
echo -n "un texte beaucoup plus long que deux caracteres..."  openssl dgst -sha256
#
 ---------------------------------------------------------
#
 Exercice 3 : Corrompu ou non ?
#
 ---------------------------------------------------------
#
 Copie et Empreinte initiale
cp messageAuxSIO.txt recu.txt
clear
# ---------------------------------------------------------
# Partie 1 : Hacher un fichier et vérifier son intégrité
# ---------------------------------------------------------
# Étape 1 & 2 : Création du fichier et calcul du hachage SHA-256
echo "Les SIO sont drôlement sérieux et forts cette année." > messageAuxSIO.txt
openssl dgst -sha256 messageAuxSIO.txt
# Étape 3 : Sauvegarde de l'empreinte dans un fichier
openssl dgst -sha256 messageAuxSIO.txt > hashSIO.txt
# Étape 4 : Vérification d'intégrité (simulation échange binôme)
openssl dgst -sha256 messageAuxSIO.txt > verif_hashSIO.txt
diff hashSIO.txt verif_hashSIO.txt && echo "INTACT" || echo "ALTERE"
# ---------------------------------------------------------
# Exercice 1 : L'effet d'avalanche
# ---------------------------------------------------------
echo -n "Bonjour" | openssl dgst -sha256
echo -n "bonjour" | openssl dgst -sha256
# ---------------------------------------------------------
# Exercice 2 : La longueur fixe
# ---------------------------------------------------------
echo -n "ok" | openssl dgst -sha256
echo -n "un texte beaucoup plus long que deux caracteres..." | openssl dgst -sha256
# ---------------------------------------------------------
# ---------------------------------------------------------
# Partie 1 : Hacher un fichier et vérifier son intégrité
# ---------------------------------------------------------
# Étape 1 & 2 : Création du fichier et calcul du hachage SHA-256
echo "Les SIO sont drôlement sérieux et forts cette année." > messageAuxSIO.txt
openssl dgst -sha256 messageAuxSIO.txt
# Étape 3 : Sauvegarde de l'empreinte dans un fichier
openssl dgst -sha256 messageAuxSIO.txt > hashSIO.txt
# Étape 4 : Vérification d'intégrité (simulation échange binôme)
openssl dgst -sha256 messageAuxSIO.txt > verif_hashSIO.txt
diff hashSIO.txt verif_hashSIO.txt && echo "INTACT" || echo "ALTERE"
# ---------------------------------------------------------
# Exercice 1 : L'effet d'avalanche
# ---------------------------------------------------------
echo -n "Bonjour" | openssl dgst -sha256
echo -n "bonjour" | openssl dgst -sha256
# ---------------------------------------------------------
# Exercice 2 : La longueur fixe
# ---------------------------------------------------------
echo -n "ok" | openssl dgst -sha256
echo -n "un texte beaucoup plus long que deux caracteres..." | openssl dgst -sha256
# ---------------------------------------------------------
# Exercice 3 : Corrompu ou non ?
# ---------------------------------------------------------
# Copie et Empreinte initiale
cp messageAuxSIO.txt recu.txt
openssl dgst -sha256 recu.txt
# Altération du fichier (suppression de l'accent sur "sérieux") et nouvelle empreinte
echo "Les SIO sont drolement serieux et forts cette année." > recu.txt
openssl dgst -sha256 recu.txt
# ---------------------------------------------------------
# Exercice 4 : Pourquoi MD5 est-il « cassé » ?
# ---------------------------------------------------------
echo -n "ENC" | openssl dgst -md5
echo -n "ENC" | openssl dgst -sha256
# ---------------------------------------------------------
# Exercice 5 : Une collision MD5 en vrai (démonstration)
# ---------------------------------------------------------
# Assurez-vous d'avoir collision1.pdf et collision2.pdf dans le dossier courant
openssl dgst -md5 collision1.pdf collision2.pdf
openssl dgst -sha256 collision1.pdf collision2.pdf
# ---------------------------------------------------------
# Exercice 6 : MD5 est mort, SHA-1 aussi
# ---------------------------------------------------------
# Assurez-vous d'avoir shattered1.pdf et shattered2.pdf dans le dossier courant
openssl dgst -sha1 shattered1.pdf shattered2.pdf
