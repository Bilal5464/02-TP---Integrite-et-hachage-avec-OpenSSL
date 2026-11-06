#!/usr/bin/env bash
# ============================================================
#  fabrique-depot-audit.sh
#  Bloc 3 SIO1 - TP1 : Auditer un depot Git (RGPD)
#
#  Fabrique en local le depot "mycom-audit" avec un historique
#  qui contient volontairement des donnees personnelles.
#  Toutes les donnees sont FICTIVES.
#
#  Usage (dans Git Bash) :
#      bash fabrique-depot-audit.sh
#      bash fabrique-depot-audit.sh /c/Users/moi/Documents/mycom-audit
# ============================================================

set -e

DEST="${1:-$HOME/Documents/mycom-audit}"

if [ -e "$DEST" ]; then
    echo "Le dossier existe deja : $DEST"
    echo "Supprimez-le ou donnez un autre chemin en argument."
    exit 1
fi

mkdir -p "$DEST"
cd "$DEST"
git init -q -b main
git config core.safecrlf false

# --- Deux "developpeurs" fictifs, pour que l'audit puisse attribuer les commits
KARIM_N="Karim Bouaziz";  KARIM_M="k.bouaziz@mycallcenter.fr"
LEA_N="Lea Moreau";       LEA_M="l.moreau@mycallcenter.fr"

commit_as () {   # commit_as "Nom" "mail" "date" "message"
    GIT_AUTHOR_NAME="$1"  GIT_AUTHOR_EMAIL="$2"  GIT_AUTHOR_DATE="$3" \
    GIT_COMMITTER_NAME="$1" GIT_COMMITTER_EMAIL="$2" GIT_COMMITTER_DATE="$3" \
    git commit -q -m "$4"
}

# ------------------------------------------------------------
# Commit 1 - initialisation du projet
# ------------------------------------------------------------
cat > README.md <<'EOF'
# MyCom - module d'import des etudes de marche

Prototype interne MyCallCenter.
Importe les reponses aux questionnaires (CSV, JSON) dans la base.
EOF
git add -A
commit_as "$LEA_N" "$LEA_M" "2026-01-12T09:14:00" "Initialise le projet MyCom"

# ------------------------------------------------------------
# Commit 2 - LA FUITE : un export de production "pour tester"
# ------------------------------------------------------------
mkdir -p data
cat > data/export-clients.csv <<'EOF'
id;nom;prenom;email;code_postal;ip_connexion;id_cookie;num_secu;carte_bancaire;commentaire_libre
1001;Dupont;Claire;claire.dupont@exemple.fr;75012;92.184.106.12;c8f3a1e29b;2 84 05 75 116 042;4974 XXXX XXXX 3312;Demande une chambre PMR, se deplace en fauteuil roulant
1002;Nguyen;Thomas;t.nguyen@exemple.fr;69003;88.121.44.7;a01db77c45;1 90 11 69 384 077;5412 XXXX XXXX 0091;Ne pas appeler le samedi, pratique religieuse
1003;Berthier;Ana;ana.berthier@exemple.fr;33000;176.152.9.240;77bc0e1af2;2 88 03 33 220 013;4539 XXXX XXXX 7745;Delegue syndical du site, passer par lui pour le planning
1004;Lopes;Marc;marc.lopes@exemple.fr;59000;90.63.201.88;3de9c04b16;1 79 07 59 501 038;4024 XXXX XXXX 1180;RAS
1005;Fontaine;Sophie;s.fontaine@exemple.fr;75018;92.184.110.55;bb27f9a3d0;2 91 12 75 907 021;5155 XXXX XXXX 6603;Traitement en cours, rappeler apres 18h
EOF
git add -A
commit_as "$KARIM_N" "$KARIM_M" "2026-01-19T16:47:00" "Ajoute un export clients pour tester l'import CSV"

# ------------------------------------------------------------
# Commit 3 - LA FUITE (bis) : les secrets de connexion
# ------------------------------------------------------------
mkdir -p config
cat > config/.env <<'EOF'
DB_HOST=srv-bdd-01.mycallcenter.local
DB_USER=mycom_app
DB_PASSWORD=Etude2026!prod
SMTP_USER=noreply@mycallcenter.fr
SMTP_PASSWORD=Sm7p-MyCall-2026
API_TOKEN=mc_live_9f4c2ab77e1d4e0b
EOF
git add -A
commit_as "$KARIM_N" "$KARIM_M" "2026-01-19T17:02:00" "Ajoute la configuration de connexion a la base"

# ------------------------------------------------------------
# Commit 4 - le "menage" : on retire l'export... du dernier etat
# ------------------------------------------------------------
git rm -q data/export-clients.csv
commit_as "$LEA_N" "$LEA_M" "2026-02-02T10:23:00" "Retire l'export clients (donnees reelles, alerte du DPO)"

# ------------------------------------------------------------
# Commit 5 - le remplacant, cette fois anonymise
# ------------------------------------------------------------
mkdir -p data
cat > data/jeu-de-test.csv <<'EOF'
id;tranche_age;departement;canal;nb_reponses
1;25-34;75;web;12
2;35-44;69;telephone;8
3;45-54;33;mobile;15
4;18-24;59;web;9
EOF
git add -A
commit_as "$LEA_N" "$LEA_M" "2026-02-02T10:31:00" "Ajoute un jeu de test anonymise"

# ------------------------------------------------------------
# Commit 6 - du bruit, pour que la fuite ne soit pas au sommet
# ------------------------------------------------------------
cat > index.html <<'EOF'
<!doctype html>
<html lang="fr">
  <head><meta charset="utf-8"><title>MyCom - import</title></head>
  <body>
    <h1>Import des reponses</h1>
    <button id="go">Importer le fichier</button>
  </body>
</html>
EOF
git add -A
commit_as "$KARIM_N" "$KARIM_M" "2026-02-09T11:05:00" "Ajoute la page d'import et corrige le libelle du bouton"

echo
echo "Depot fabrique : $DEST"
echo "Il contient $(git rev-list --count HEAD) commits."
echo "Placez-vous dedans :  cd \"$DEST\""
