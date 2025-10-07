#!/usr/bin/env bash
set -euo pipefail

APP="${1:-web}"
ENVIRONMENT="${2:-staging}"

echo "==> Déploiement déclenché"
echo "App        : ${APP}"
echo "Environnement : ${ENVIRONMENT}"
echo

case "${APP}" in
  web|api) echo "[OK] App reconnue";;
  *) echo "[ERREUR] App inconnue: ${APP}" && exit 2;;
esac

case "${ENVIRONMENT}" in
  dev|staging|prod) echo "[OK] Environnement reconnu";;
  *) echo "[ERREUR] Environnement inconnu: ${ENVIRONMENT}" && exit 3;;
esac

echo "[Étape] Build (simulé)…"
sleep 1
echo "[Étape] Tests (simulés)…"
sleep 1
echo "[Étape] Déploiement (simulé)…"
sleep 1

if [ -f ".env" ]; then
  echo "[Info] .env détecté, variables chargées"
  set -a; source .env; set +a
fi

echo
echo "🎉 Déploiement terminé (fake) pour ${APP} → ${ENVIRONMENT}"
