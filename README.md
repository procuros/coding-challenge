# Procuros coding challenge

## Introduction
This is a coding challenge for Procuros. The main goal of the challenge to 
- Read a csv file containing a list of product variants.
- Save the products + variants in the database tables products amd variants.

## Details
- The Input file is located in `public/input.csv`.
- To explain the structure of the csv file:
- Each row represents a **product variant**.
- The **product** info are repeated in each row.
- Each row looks like this:
  - **Handle**: It's the identifier of the product in the source system, we are procuros are not going to save it.
  - **Title**: The title of the product -> should be mapped to `name` field in the `products` table.
  - **Vendor**: Product Brand -> should be mapped to `brand` field in the `products` table.
  - **Variant SKU**: The SKU of the variant -> should be mapped to `sku` field in the `variants` table.
  - **Variant Inventory Qty**: The quantity of the variant -> should be mapped to `quantity` field in the `variants` table.
  - **Variant Price**: The price of the variant -> should be mapped to `price` field in the `variants` table.
  - **Variant Barcode**: The barcode of the variant -> should be mapped to `barcode` field in the `variants` table.
- _Just for clarification: the result of the given file should be `3 products` and `6 variants`._

## Requirements
- The entry point will be `app/Console/Commands/ImportProductsCommand.php` command that takes a csv file path as an argument and syncs the products and variants in the database.
- The source data need to be validated against certain rules before saving it in the database.
  - The validation rules (need to be applied on CSV Data) are:
    - The `Handle` field is mandatory.
    - The `Vendor` field is mandatory.
    - The `Variant SKU` field should be unique and mandatory.
    - The `Variant Inventory Qty` field should be a positive integer >= 0.
    - The `Variant Price` field should be a positive float and can't be 0.
    - The `Variant Barcode` field should be optional and a 9 digits string (when provided).
  - For invalid rows, we should skip them and report them back as corrupted rows.
- The data need to be mapped correctly to the database tables.
- The data should be saved into the database tables.

## Nice To Have
- The ability to handle large files (millions of rows) and consume them efficiently.
- The same functionality will be used from an api later on. 

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

some commands that can be useful
    
    
    make artisan # to run artisan commands
    make test # to run the tests
    make shell # to get into the php container

Good luck!
