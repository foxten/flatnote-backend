# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Note.destroy_all

User.create(username: 'Tenaysia', password:'fox')
Category.create(name: 'Testing things')
Note.create(subject: 'First test', content: 'This is just a test. I should be able to see all of the data for this note when the server is running.', shareable: true, user_id: 1, category_id: 1)


4.times {
    User.create(username: Faker::Name.first_name, password: Faker::Verb.base)
}

10.times{
    Category.create(name: Faker::Book.title)
}

50.times{
    Note.create(subject:Faker::Hipster.sentence , content:Faker::Hipster.paragraph , shareable: Faker::Boolean.boolean , user_id: User.all.sample.id , category_id: Category.all.sample.id)
}