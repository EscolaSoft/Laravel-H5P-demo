fix-style:
	- docker-compose exec app bash -c "./vendor/bin/php-cs-fixer fix ."

test-phpunit:
	- docker-compose exec app bash -c "./vendor/bin/phpunit"

test-behat:
	- docker-compose exec app bash -c "./vendor/bin/behat --colors"

bash:
	- docker-compose exec app bash

ide-helper:
	- docker-compose exec app bash -c "php artisan ide-helper:generate && mv _ide_helper.php .phan/stubs/_ide_helper.php"

migrate-fresh-quick:
	- docker-compose exec app bash -c "php artisan migrate:fresh --seed"
	- docker-compose exec app bash -c "php artisan passport:keys --force"
	- docker-compose exec app bash -c "php artisan passport:client --personal --no-interaction"

composer-update:
	- docker-compose exec app bash -c "composer update"

swagger-generate:
	- docker-compose exec app bash -c "php artisan l5-swagger:generate"

h5p-seed:
	- docker-compose exec app bash -c "php artisan db:seed --class=H5PLibrarySeeder"
	- docker-compose exec app bash -c "php artisan db:seed --class=H5PContentSeeder"
	- docker-compose exec app bash -c "php artisan db:seed --class=HP5ContentCoursesSeeder"

migrate-fresh: migrate-fresh-quick h5p-seed

