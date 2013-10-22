# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

require 'faker'

user = User.create(:email => 'alberto@moralitos.com', :password => 'development')

100.times do |i|
  Keychain.create(:name => "key #{i}", :username => Faker::Internet.email, :description => Faker::Lorem.sentence(30), :password => "#{rand(10000)}")
end
