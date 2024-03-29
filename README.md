# Procuros coding challenge

## Introduction
This is a coding challenge for Procuros, thanks for taking the time to do it!
In order to complete the challenge, you will need to:
- [Mirror this repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository) on your own github account.
  - Make the repository private.
  - Add the user `hanihh` and `mozammil` as a collaborators.
  - (Optional) Would be great if you keep all of your changes in a separate branch. 
- Install and run the application and make sure it's working using the tutorial below.
- Once you are done, you can open the `onetimesecret.com` link sent by email which contains the APP_KEY environment variable needed to run the application.
- Place the APP_KEY in the `.env` file.
- Run the command `make generate-requirements` in order to generate the requirement files.
- The output of this command will be two files `REQUIREMENTS.md` and `public/input.csv`.

## Instructions
- Once you open `onetimesecret.com` link, you have 48 hours to complete the challenge.
- We estimate that the challenge should take around 4 hours to complete.
- You can ask us any questions you have about the challenge, we will be happy to answer them.
- You can use any external libraries you want.
- You can use any support tools you want (IDE, debuggers, ChatGPT, Github Copilot, etc).
- The evaluation of the coding challenge is based on:
  - The solution design/architecture.
  - The solution completion.
  - The code quality.
  - The tests quality.
  - The documentation quality.
  - The time taken to complete the challenge.
- When you are done, please notify us by email.

## Running the application
The application can be installed by running the following commands:

```
make install
```

This will do the following:
- Builds the docker containers needed for the application. These include:
    - A php-fpm container mainly responsible for serving web requests. Accessible at: `http://localhost:8080`.
    - A scheduler which is running Laravel's `schedule:run` in a loop every 60 seconds.
    - A queue worker which is processing messages in the `default` queue.
- Installs the composer dependencies.
- Migrates the database.


Good luck!
