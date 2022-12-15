# One-Time Setup of the Development Environment Cluster

## Either run the installation requirements (recommended)

or manually install git, docker, kind, helm and skaffold

Recommended, fast and easy way:
Change Directory to tools/mac and run ` .sh install_requirements.sh `

### Configure the local dev environment

stay in same dir (tools/mac) and run `sh setup_env.sh`

### Start cluster on local

The setup script should take you to root dir, but it can't hurt to make sure you are there.

If `pwd` returns root dir, run `skaffold dev`

## For the environment to launch succsessfully make sure

### this is how the directory looks

```bash
├── cm-cluster-devops
    ├── cloudmanager-backend
    ├── cloudmanager-environment-orchestrator
    ├── cloudmanager-ui
    ├── helm
    ├── install.sh
    ├── skaffold.yaml
    └── tools
```

### this are the first 10 lines of .env in cloudmanager-backend

```dotenv
BULL_REDIS_URL=redis://cloudmanager-redis-master:6379
REDIS_HOST=cloudmanager-redis-master
REDIS_PORT=6379

DATABASE_HOST=cloudmanager-psql-postgresql
DATABASE_PORT=5432
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=postgres
DATABASE_NAME=cloudmanager
DATABASE_SCHEMA=public 
```
