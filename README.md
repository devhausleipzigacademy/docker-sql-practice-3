# Docker & SQL Practice #3

## Prerequisites
- Have Docker installed
- Create an `.env` file and add to it:
```sh
POSTGRES_USER=local_admin
POSTGRES_PASSWORD=unsafeLocalPassword0!
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=main
DATABASE_URL=postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?schema=public&connect_timeout=300
```
- Run `docker-compose build` to build image for backend container (prisma DB client & express http server)
- Run `docker-compose up -d` to spin up DB and backend containers
- The first time you run the containers, wait until they are fully running, then run `npm run migrate` and then `npm run seed` to ensure the DB is seeded with test data

## Changing the schemata
When you change the Prisma models/DB schemata, you can simply rebuild the container. However, the data in the database/in the seed file may no longer match. You will have to update the seed file to match the changed models.

If old data is still in the DB and is not removed by Prisma as part of a migration, you can manually reset the data stored in the PostgreSQL volume by ensuring the containers are not running (`docker-compose stop`) and then executing `docker volume prune` to delete the managed volume. Then you can start up the containers again and then run `npm run migrate`.
