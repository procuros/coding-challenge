# Procuros coding challenge

## Introduction
This is a coding challenge for Procuros. The main goal of it is to:
- Read a csv file containing a list of product and their variants.
- Save the products and their variants in the database tables: `products` and `variants`.
- This file is used regularly as a "masterdata" to update product variants and their stock quantity for the business.

## The CSV file
- The csv file is located in `public/input.csv`. It is structured as follows:
  - Each row represents a **product variant**.
  - The **product** info are repeated in each row.
  - Each row looks like this:
    - **Handle**: It's the identifier of the product in the source system.
    - **Title**: The title of the product. This should be mapped to the `name` field in the `products` table.
    - **Vendor**: Product Brand. This should be mapped to the `brand` field in the `products` table.
    - **Variant SKU**: The SKU of the variant. This should be mapped to the `sku` field in the `variants` table.
    - **Variant Inventory Qty**: The quantity of the variant. This should be mapped to the `quantity` field in the `variants` table.
    - **Variant Price**: The price of the variant. This should be mapped to the `price` field in the `variants` table.
    - **Variant Barcode**: The barcode of the variant. This should be mapped to the `barcode` field in the `variants` table.
- The end result should be that after reading the file, we have `3 products` and `6 variants` in the database.

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
  - For invalid rows, we should skip them and report them back as corrupted rows during execution of the command.
- The data need to be transformed correctly so that we can persist it in the database.
- Please introduce a new column on the `variants` table called `status`. The column should have the following possible values: `in_stock`, `low_stock`, `out_of_stock` based on the following criteria:
  - in_stock: if the quantity > 10
  - low_stock: if the quantity <= 10
  - out_of_stock: if the quantity = 0

## What we're also looking for
- The ability to handle large files (millions of rows) and consume them efficiently.
- The same functionality will be used by a REST endpoint later on. The REST endpoint may be able to consume multiple files concurrently. Please consider that when building the solution, especially for the database structure.
- You are free to do the source data validation as you like. However, we would *prefer* if you're able to leverage a JSON Schema Draft 2020-12 to do it. The validation rules should be based on the same rules specified above.
- Even if we've provided a base structure for the solution (command, models, database structure), please feel free to adapt it as you see fit. Nothing is set in stone, except obviously the CSV file.

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

### Useful commands
    
Feel free to browse the contents of the `Makefile` to see what's possible. Some useful commands are listed below:

```
make import # to run the importer command
make test # to run the tests
make shell # to run bash on the php container
```

Good luck!
