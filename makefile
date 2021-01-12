docker-up:
	- docker-compose up -d;

bash:
	- docker-compose exec app bash

migrate-fresh:
	- docker-compose exec app bash -c "php artisan migrate:fresh --seed"

composer-update:
	- docker-compose exec app bash -c "composer update"

publish:
	- docker-compose exec app bash -c 'php artisan vendor:publish --provider="EscolaSoft\LaravelH5p\LaravelH5pServiceProvider"'

init: docker-up composer-update migrate-fresh


## storage link
## migrate
## seed
## publish php artisan vendor:publish --provider="EscolaSoft\LaravelH5p\LaravelH5pServiceProvider"
