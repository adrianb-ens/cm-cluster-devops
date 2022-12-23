# One-Time Setup of the Development Environment Cluster

## Setup from scratch (clean setup) 

Recommended, fast and easy way:
Run ` ./install.sh ` and follow the setup to get everything installed and set up

Or manually install git, docker, kind, helm and skaffold

### Configure the local dev environment

Recommended, fast and easy way:
Run ` ./install.sh ` and use the 'Setup only' options for either Windows or MacOS

### Start cluster on local

The setup script should take you to root dir, but it can't hurt to make sure you are there.

If `pwd` returns root dir, run `skaffold dev`

## For the environment to launch succsessfully make sure

### this is how the directory looks

```bash
├── cm-cluster-devops
    ├── helm
    ├── kubernetes
    ├── src
          ├── cloudmanager-backend
          ├── cloudmanager-environment-orhcestrator
          ├── cloudmanager-ui
    ├── tools
    ├── install.sh
    ├── kind-config.yaml
    ├── README.md
    ├── skaffold.yaml
```

### this are the first 10 lines of src/cloudmanager-backend/.env

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
