require 'roo'
require 'json'
require 'csv'

csv_string = CSV.generate do |csv|
  JSON.parse(File.open("ASpaceRel2.1.0InitialDataDictionary.json").read).each do |hash|
    csv << hash.values[1]
  end
end

puts csv_string
