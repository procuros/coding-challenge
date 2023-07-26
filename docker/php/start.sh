#!/usr/bin/env bash
 
set -e
 
role=${CONTAINER_ROLE:-app}
  
if [ "$role" = "app" ]; then
 
    exec php-fpm
 
elif [ "$role" = "worker" ]; then

    echo "Running the worker..."
    php /var/www/html/artisan queue:work --verbose --tries=3 --timeout=90

elif [ "$role" = "scheduler" ]; then

    while [ true ]
    do
        php /var/www/html/artisan schedule:run --verbose --no-interaction &
        sleep 60 & wait $!
    done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi