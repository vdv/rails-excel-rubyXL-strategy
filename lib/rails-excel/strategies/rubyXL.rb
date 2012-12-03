require 'rubyXL'
module RailsExcel
  module Strategies
    module RubyXL
      extend self

      def compile(io, &block)
        temp_path = Rails.root.join("tmp/workbook_#{Time.now.to_i}.xlsx").to_s
        workbook = ::RubyXL::Workbook.new
        yield(workbook)
        workbook.write(temp_path)
        content = File.read(temp_path)
        FileUtils.rm(temp_path)
        io.write content
      end

    end
  end
end
::Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx

