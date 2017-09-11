require 'csv'
require 'json'

# Expected data format. (Comma separated csv).
# None,Quiet,Powerful,Remote
# None,245,95,927
# Rabbit,61,25,27,1
# Bullet,77,28,40,5
# Classic,35,15,18,0
# Realistic,74,27,7,1
data = CSV.read('data.csv')

# Return an array of categories on the x axis.
categories = data[0].map(&:downcase)
categories.map! { |cat| cat == "none" ? nil : cat }

# Remove the categories from the data array.
data.shift

# Map the data and return a hash.
data = data.each_with_object({}) do |row, memo|
  hash = {}
  row[1..-1].each_with_index.map do |el, i|
    hash[categories[i]] = el
  end

  other_category = row[0].split(" ")[0].downcase
  other_category == "none" ? memo[nil] = hash : memo[other_category] = hash 
end

# Output as a Ruby hash
# {nil=>{nil=>"245", "quiet"=>"95", "powerful"=>"92", "remote"=>"7"}, "rabbit"=>{nil=>"61", "quiet"=>"25", "powerful"=>"27", "remote"=>"1"}, "bullet"=>{nil=>"77", "quiet"=>"28", "powerful"=>"40", "remote"=>"5"}, "classic"=>{nil=>"35", "quiet"=>"15", "powerful"=>"18", "remote"=>"0"}, "realistic"=>{nil=>"74", "quiet"=>"27", "powerful"=>"7", "remote"=>"1"}} 

data.to_json
# "{\"\":{\"\":\"245\",\"quiet\":\"95\",\"powerful\":\"92\",\"remote\":\"7\"},\"rabbit\":{\"\":\"61\",\"quiet\":\"25\",\"powerful\":\"27\",\"remote\":\"1\"},\"bullet\":{\"\":\"77\",\"quiet\":\"28\",\"powerful\":\"40\",\"remote\":\"5\"},\"classic\":{\"\":\"35\",\"quiet\":\"15\",\"powerful\":\"18\",\"remote\":\"0\"},\"realistic\":{\"\":\"74\",\"quiet\":\"27\",\"powerful\":\"7\",\"remote\":\"1\"}}"
