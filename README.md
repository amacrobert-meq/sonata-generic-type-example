# sonata-generic-type-example

Reproduction of `sonata-project/admin-bundle` issue [TBA].

## How to run

1. `docker-compose up --build -d`
2. `docker exec -it sonata-generic-type-example composer install`
3. `docker exec -it sonata-generic-type-example symfony serve -d`
4. `docker exec -it sonata-generic-type-example bin/console doctrine:schema:create`
5. Open http://127.0.0.1:8345/

## Reproduce

After following the above steps, run
```bash
docker exec -it sonata-generic-type-example vendor/bin/phpstan
```
