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
