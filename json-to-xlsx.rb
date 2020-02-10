require 'spreadsheet'
require 'json'

puts "Spreadsheet Test\n"

row_1 = ['Field Name', 'Field Type']

new_book = Spreadsheet::Workbook.new

counter = 0

JSON.parse(File.open("ASpaceRel2.1.0InitialDataDictionary.json").read).each do |hash|
  new_book.create_worksheet :name => "#{hash.values[0]}"
  new_book.worksheet(counter).insert_row(0, row_1)
  ctr = 1
  hash.values[1].each do | field_hash |
    new_book.worksheet(counter).insert_row(ctr, [field_hash['field_name'], field_hash['field_type']])
    ctr += 1
  end
  counter += 1
end

new_book.write('data_dictionary.xls')
