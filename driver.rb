#!/usr/bin/ruby
require 'pry'
require File.join(Dir.pwd, 'bin/require_tree')


Io::OutputFormatter.please_enter_text

items_line = gets
items = Io::InputFormatter.parse_items(items_line)

sale_price_configs = Parser::SalePriceParser.new
