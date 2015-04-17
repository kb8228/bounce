# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = Player.create([
  {name: "Slava B", email:"slava_b@example.ru", password: "1234", image: nil, years_played: 15, num_matches: 0, doubles: true},
  {name: "Larisa B", email: "larisa_b@example.ru", password: "12345", image: nil, years_played: 8, num_matches: 0, doubles:true},
  {name: "Sonya B", email: "sonya_b@example.ru", password: "123456", image: nil, years_played: 20, num_matches: 0, doubles:false}
])