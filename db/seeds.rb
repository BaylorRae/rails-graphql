# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }

SPLIT = 0.4
OFFSET = PROJECT_TITLES.length * SPLIT

PROJECT_USERS = {
  'leo@example.com' => PROJECT_TITLES[0, OFFSET],
  'bob@example.com' => PROJECT_TITLES[OFFSET..-1]
}

PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password: 'secret')
  projects.each { |title| user.projects.build(title: title) }
  user.save
end
