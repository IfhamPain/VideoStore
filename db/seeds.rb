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
                   password_confirmation: 'asdasd'
                 })
u2 = User.create({ first_name: 'Member',
                   last_name: "One",
                   address:"Member Address",
                   role:0,
                   gender:0,
                   email: 'member@test.com',
                   password: 'asdasd',
                   password_confirmation: 'asdasd'})

5.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  address = Faker::Address.full_address
  gender = rand(0..2)
  email = Faker::Internet.email
  User.create!(first_name: first_name,
               last_name: last_name,
               email:email,
               address: address,
               gender: gender,
               password: "foobar",
               password_confirmation:"foobar"
  )
end

s1 = Superuser.create({ first_name: 'Super',
                   last_name: "One",
                   address:"Super Address",
                   gender:0,
                   email: 'super@test.com',
                   password: 'asdasd',
                   password_confirmation: 'asdasd' })


#add genres
genres = Genre.create([
                          { genre: 'Horror' },
                          { genre: 'Comedy' },
                          { genre: 'Action' },
                          { genre: 'Adventure' },
                          { genre: 'Thriller' },
                          { genre: 'Drama' },
                      ])

#Add moviegenre
Movie.count.times do |n|
  temp_genre_id = rand(0..5)
  MovieGenre.create(movie_id: n,
                    genre_id:temp_genre_id)
  MovieGenre.create(movie_id: n,
                    genre_id:5 - temp_genre_id)
end

#add actors
99.times do |n|
  name  = Faker::Name.name
  date_of_birth = Faker::Date.between(from: '1955-09-23', to: '1995-09-25')
  Actor.create!(name:  name,
                date_of_birth: date_of_birth)
  ActorMovie.create(movie_id:rand(1..Movie.count),
                    actor_id:n)
end


#add movies
40.times do |n|
  title = Faker::Movie.title
  description = Faker::Movie.quote
  release_date = Faker::Date.between(from: '1955-09-23', to: '2020-09-25')
  content = rand(0..3)
  Movie.create!(title: title,
                description: description,
                release_date: release_date,
                content: content
  )
end

#add Movie Type
movie_types = MovieCopyType.create([
                                   { copy_type: 'Bluray' },
                                   { copy_type: 'DVD' },
                                   { copy_type: 'VHS' }
                               ])