# Slack → n8n → GitHub Actions (workflow_dispatch)

Ce repo fournit un workflow GitHub Actions déclenchable à la demande (workflow_dispatch)
avec deux inputs: `app` et `env`. Il est pensé pour être appelé depuis n8n (slash-command Slack).

## Utilisation locale (manuel)
Dans l'onglet "Actions" du repo → workflow **Deploy** → "Run workflow" :
- ref: `main`
- inputs:
  - app: `web`
  - env: `staging` (ou `prod`)

## Variables (facultatif)
Copiez `.env.sample` en `.env` si vous souhaitez que `deploy.sh` lise des secrets
(ou utilisez directement les GitHub Secrets dans le workflow).

## Fichiers
- `.github/workflows/deploy.yml` : workflow GitHub Actions.
- `scripts/deploy.sh` : script de déploiement factice (exemple) appelé par le job.

## Intégration n8n
Importez le JSON `n8n/slack-deploy.json` (fourni dans ce projet à part) puis :
- Mettez l'URL du Webhook n8n comme "Request URL" de la slash-command Slack `/deploy`.
- Configurez les Credentials GitHub dans n8n (PAT avec scopes `repo`, `workflow`).

## Sécurité
- Limitez les utilisateurs autorisés côt
