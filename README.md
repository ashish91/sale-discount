# Sale Discount

## How to run ?

Run the following command:

- ruby driver.rb

## Prerequisites

- Make sure ruby >= 2.7 is installed on your laptop.
- Yaml gem is available with the ruby.

## Directory Structure

- bin
    * require_tree - require various classes in this project.
- models - Data models for persisting data in memory and defines relationships between them.
- configs - config for defining the prices for the items.
- parser - parses the sale_price.yml file to load the prices of the items.
- pricing_strategy - defines how to calculate the prices for the items. The BasicPricingStrategy class is used for calculating the price using the sale_price of the week.

## Edge cases

- Incorrectly defining values in sale_price.yml can lead to edge cases, for eg. defining non numeric price, negative price etc.
- The user can input an item which is not defined in the configs, this can cause error. Make sure to define the price for items.
