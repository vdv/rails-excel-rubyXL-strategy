require 'rails-excel'
require "rails-excel/strategies/rubyXL"
require "rails-excel/strategies/rubyXL/version"
::RailsExcel.add_strategy :rubyXL, RailsExcel::Strategies::RubyXL
