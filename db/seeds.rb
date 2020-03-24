# Seed DB with initial sample data from Faker
user = User.first
#precompute projects
projects = []
6.times do
    projects << Project.create(name: Faker::App.name)
end
20.times do
    name = Faker::Games::Witcher.character
    telegram_id = "@#{Faker::Internet.username}"
    salary = Faker::Number.between(from: 15000, to: 150000)
    working_hours = Faker::Number.between(from: 15, to: 50)
    job = Faker::Company.profession
    # Create employee
    e = user.employees.create(name: name, telegram_id: telegram_id, 
            salary: salary, working_hours: working_hours, job: job)
    # And give him 3 - 6 projects
    (0..Faker::Number.between(from: 2, to: 5)).each {|i|  e.assign(projects[i])}
end