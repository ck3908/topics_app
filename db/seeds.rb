# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# instead of require, use include for shorthand
include Faker

# see if it works
m = Company.catch_phrase
n = Commerce.department
p = Lorem.paragraphs(1)
q = Name.name

puts m.inspect
puts n.inspect
puts p.inspect
puts q.inspect

3.times do
  a = Topic.create(:title => Company.catch_phrase,
                   :sector => Commerce.department ,
                   :content => Lorem.paragraphs(2).join(", "),
                   :made_by => Name.name)
  puts a.inspect
end
