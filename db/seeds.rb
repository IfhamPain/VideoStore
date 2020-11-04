# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create({ first_name: 'Admin',
                   last_name: "One",
                   address:"Admin Address",
                   role:1,
                   gender:1,
                   email: 'admin@test.com',
                   password: 'asdasd',
                   password_confirmation: 'asdasd' })
u1.skip_confirmation!
u1.save



u2 = User.create({ first_name: 'Member',
                   last_name: "One",
                   address:"Member Address",
                   role:0,
                   gender:0,
                   email: 'member@test.com',
                   password: 'asdasd',
                   password_confirmation: 'asdasd' })
u2.skip_confirmation!
u2.save

s1 = Superuser.create({ first_name: 'Super',
                   last_name: "One",
                   address:"Super Address",
                   gender:0,
                   email: 'super@test.com',
                   password: 'asdasd',
                   password_confirmation: 'asdasd' })

s1.skip_confirmation!
s1.save

