# Procuros coding challenge

## Running the application
The application can be installed by running the following commands:

```
make build
make install
```

This will do the following:
- Builds the docker containers needed for the application. These include:
    - A php-fpm container mainly responsible for serving web requests.
    - A scheduler which is running Laravel's `schedule:run` in a loop every 60 seconds.
    - A queue worker which is processing messages in the `default` queue.
- Installs the composer dependencies.
- Migrates the database.
