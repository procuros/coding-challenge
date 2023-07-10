# Procuros coding challenge

## Introduction
This is a coding challenge for Procuros. The main goal of the challenge to 
- Read a csv file containing a list of product variants.
- Save the products + variants in the database tables products amd variants.

## Details
- The Input file is located in `public/input.csv`.
- To explain the structure of the csv file:
- Each row represents a product variant.
- The product info are repeated in each row.
- Each row looks like this:
  - **Handle**: It's the identifier of the product in the source system, we are procuros should not rely on it.
  - **Title**: The title of the product -> should be mapped to `name` field in the `products` table.
  - **Vendor**: Product Brand -> should be mapped to `brand` field in the `products` table.
  - **Variant SKU**: The SKU of the variant -> should be mapped to `sku` field in the `variants` table.
  - **Variant Inventory Qty**: The quantity of the variant -> should be mapped to `quantity` field in the `variants` table.
  - **Variant Price**: The price of the variant -> should be mapped to `price` field in the `variants` table.
  - **Variant Barcode**: The barcode of the variant -> should be mapped to `barcode` field in the `variants` table.

## Requirements
- Build an artisan command that takes a csv file path as an argument and syncs the products and variants in the database.
- The source data need to be validated against 

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
