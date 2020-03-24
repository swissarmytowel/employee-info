# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first
20.times do
    name = Faker::Games::Witcher.character
    telegram_id = "@#{Faker::Internet.username}"
    salary = Faker::Number.between(from: 15000, to: 150000)
    working_hours = Faker::Number.between(from: 15, to: 50)
    job = Faker::Company.profession
    e = user.employees.create(name: name, telegram_id: telegram_id, 
            salary: salary, working_hours: working_hours, job: job)
    3.times do
        e.assign(Project.create(name: Faker::App.name))
    end
end