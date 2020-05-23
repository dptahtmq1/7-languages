module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each(&block)
      @csv_contents.each do |content|
        csvRow = CsvRow.new(@headers, content)
        block.call csvRow
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class CsvRow
  attr_accessor :headers, :content

  def initialize(headers = [], content = [])
    @headers = headers
    @content = content
  end

  def method_missing name, *args
    header = name.to_s
    index = @headers.index(header)
    puts @content[index] unless index.nil?
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }