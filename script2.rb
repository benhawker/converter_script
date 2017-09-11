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

# Map the data and return a hash
data = data.each_with_object({}) do |row, memo|
  hash = {}
  row[1..-1].each_with_index.map do |el, i|
    hash[categories[i]] = el
  end

  other_category = row[0].split(" ")[0].downcase
  other_category == "none" ? memo[nil] = hash : memo[other_category] = hash 
end
data

js_function = <<-JSFUNC
function getNumberResults(style, feature) {
     var result;
 
     if (style == null) {
       switch (feature) {
         case null:
           result = "#{data[nil][nil]} Match";
           break;
         case "quiet":
           result = "#{data[nil]["quiet"]} Match";
           break;
         case "powerful":
           result = "#{data[nil]["powerful"]} Match";
           break;
         case "remote":
           result = "#{data[nil]["remote"]} Match";
           break;
         default:
           result = "#{data[nil].values.inject(0){|sum,x| sum + x.to_i }} Match";
       }
     }
     if (style == "rabbit") {
       switch (feature) {
         case null:
           result = "#{data["rabbit"][nil]} Match";
           break;
         case "quiet":
           result = "#{data["rabbit"]["quiet"]} Match";
           break;
         case "powerful":
           result = "#{data["rabbit"]["powerful"]} Match";
           break;
         case "remote":
           result = "#{data["rabbit"]["remote"]} Match";
           break;
         default:
           result = "#{data["rabbit"].values.inject(0){|sum,x| sum + x.to_i }} Match";
       }
     }
     if (style == "bullet") {
       switch (feature) {
          case null:
           result = "#{data["bullet"][nil]} Match";
           break;
         case "quiet":
           result = "#{data["bullet"]["quiet"]} Match";
           break;
         case "powerful":
           result = "#{data["bullet"]["powerful"]} Match";
           break;
         case "remote":
           result = "#{data["bullet"]["remote"]} Match";
           break;
         default:
           result = "#{data["bullet"].values.inject(0){|sum,x| sum + x.to_i }} Match";
       }
     }
     if (style == "classic") {
       switch (feature) {
         case null:
           result = "#{data["classic"][nil]} Match";
           break;
         case "quiet":
           result = "#{data["classic"]["quiet"]} Match";
           break;
         case "powerful":
           result = "#{data["classic"]["powerful"]} Match";
           break;
         case "remote":
           result = "#{data["classic"]["remote"]} Match";
           break;
         default:
           result = "#{data["classic"].values.inject(0){|sum,x| sum + x.to_i }} Match";
       }
     }
     if (style == "realistic") {
       switch (feature) {
         case null:
           result = "#{data["realistic"][nil]} Match";
           break;
         case "quiet":
           result = "#{data["realistic"]["quiet"]} Match";
           break;
         case "powerful":
           result = "#{data["realistic"]["powerful"]} Match";
           break;
         case "remote":
           result = "#{data["realistic"]["remote"]} Match";
           break;
         default:
           result = "#{data["realistic"].values.inject(0){|sum,x| sum + x.to_i }} Match";
       }
     }
     return result;
   }
JSFUNC

puts js_function