# Docker & SQL Practice #3

## Prerequisites
- Create an `.env` file and add to it:
```sh
POSTGRES_USER=local_admin
POSTGRES_PASSWORD=unsafeLocalPassword0!
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=main
DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}?schema=public"
```
- Run `docker-compose build` to build image for backend container (prisma DB client & express http server)
- Run `docker-compose up -d` to spin up DB and backend containers
- The first time you run the containers, wait until they are fully running, then run `npm run migrate` and then `npm run seed` to ensure the DB is seeded with test data

## Seeding the database
A hack has been implemented to allow you to seed the database with test data for development purposes. In production, the DB should not have any externally mapped ports and should only be accessible from within the internal network. The `./prisma` folder, however, should always be a volume because you do want to persist the migrations.

## Changing the schemata
When you change the Prisma models/DB schemata, you can simply rebuild the container. However, the data in the database/in the seed file may no longer match. You will have to update the seed file to match the changed models.

If old data is still in the DB and is not removed by Prisma as part of a migration, you can manually reset the data stored in the PostgreSQL volume by ensuring the containers are not running (`docker-compose stop`) and then executing `docker volume prune` to delete the managed volume. Then you can start up the containers again and then run `npm run migrate` and `npm run seed` to seed the database with your new test data.
