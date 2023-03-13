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
user = User.new(email: "teste@teste.com", password: 123456, admin_user: true)
user.save!
user_joao = User.new(email: "joaoarthur_976@hotmail.com", password: 123456, admin_user: true)
user_joao.save!
user_manna = User.new(email: "mannaincali@gmail.com", password: 123456, admin_user: true)
user_manna.save!

puts"Users created"

puts"Creating fields"

Field.destroy_all

file = URI.open("https://fastly.4sqi.net/img/general/600x600/30685957_4h7XQN-z2KBnbEEh4k_JJpUT8B3_B5VInsqYbvQDd2Y.jpg")
field = Field.new(name: "Lauro Muller", latitude: -22.956622, longitude: -43.176104, user_id: user.id, number_of_players: 10, price: 100)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://prefeitura.rio/wp-content/uploads/2022/12/WhatsApp-Image-2022-12-20-at-11.47.20.jpeg")
field = Field.new(name: "Campo Lagoa", latitude: -22.969653, longitude: -43.216989, user_id: user.id, number_of_players: 16, price: 20)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://www.societyshow.com.br/wp-content/uploads/2021/03/foto-1-scaled.jpg")
field = Field.new(name: "Arena Society Show", latitude: -22.985447, longitude: -43.233769, user_id: user.id, number_of_players: 14, price: 300)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://psgacademy.com.br/wp-content/uploads/2020/02/PSG-Unidade-Botafogo-2-min.jpg")
field = Field.new(name: "PSG Academy Botafogo", address: "Av. Reporter Nestor Moreira, 42 - Botafogo", user_id: user.id, number_of_players: 10, price: 250)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://vasco.com.br/wp-content/uploads/2022/05/DRA_8551-scaled.jpg")
field = Field.new(name: "Campo Society Calabouço", latitude: -22.913848, longitude: -43.169898, user_id: user.id, number_of_players: 10, price: 250)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

file = URI.open("https://classic.exame.com/wp-content/uploads/2019/03/maraca1.jpg?quality=70&strip=info&w=888")
field = Field.new(name: "Maracanã", latitude: -22.912099, longitude: -43.230713, user_id: user.id, number_of_players: 22, price: 200000)
field.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
field.save!

puts"Fields created"
