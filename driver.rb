#!/usr/bin/ruby
require 'pry'
require File.join(Dir.pwd, 'bin/require_tree')


Io::OutputFormatter.please_enter_text

# items_line = gets
items_line = 'milk,milk, bread,banana,bread,bread,bread,milk,apple'
items = Io::InputFormatter.parse_items(items_line)

sale_price_configs = Parser::SalePriceParser.new

pricing = PricingStrategy::PricingCalculator.new(items_input: items, sale_price_configs: sale_price_configs)
pricing.calculate_price!

Io::OutputFormatter.price_report(pricing)

binding.pry
