# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
puts"Creating users"
Booking.destroy_all
Field.destroy_all
User.destroy_all
user = User.new(email: "teste@teste.com", password: 123456)
user.save!
user_joao = User.new(email: "joaoarthur_976@hotmail.com", password: 123456)
user_joao.save!
user_manna = User.new(email: "mannaincali@gmail.com", password: 123456)
user_manna.save!

puts"Users created"

puts"Creating fields"

file = URI.open("https://fastly.4sqi.net/img/general/600x600/30685957_4h7XQN-z2KBnbEEh4k_JJpUT8B3_B5VInsqYbvQDd2Y.jpg")
field = Field.new(name: "Lauro Muller", location: "Ao lado do shopping Rio Sul", user_id: user.id, number_of_players: 10, price: 100)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://mundograma.com.br/wp-content/uploads/2019/01/WhatsApp-Image-2018-08-20-at-10.42.18-1024x768.jpeg")
field = Field.new(name: "Bragantino", location: "Casa do kralho", user_id: user.id, number_of_players: 10, price: 100)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://classic.exame.com/wp-content/uploads/2019/03/maraca1.jpg?quality=70&strip=info&w=888")
field = Field.new(name: "Maracanã", location: "Maracanã", user_id: user.id, number_of_players: 22, price: 200000)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

puts"Fields created"
