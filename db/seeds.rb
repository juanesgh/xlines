# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: 'c@ccc.com', password: 'cccccc', password_confirmation: 'cccccc')
User.create!(email: 'b@bbb.com', password: 'bbbbbb', password_confirmation: 'bbbbbb')
User.create!(email: 'd@ddd.com', password: 'dddddd', password_confirmation: 'dddddd')
User.create!(email: 'w@www.com', password: 'wwwwww', password_confirmation: 'wwwwww')

Player.create!(name: 'Player1', user: User.find(1))
Player.create!(name: 'Player2', user: User.find(2))
Player.create!(name: 'Player3', user: User.find(3))
Player.create!(name: 'Player4', user: User.find(4))

Friendship.create!(sender: Player.find(1), receiver: Player.find(4), active: false)
Friendship.create!(sender: Player.find(2), receiver: Player.find(4), active: false)
Friendship.create!(sender: Player.find(3), receiver: Player.find(2), active: false)
Friendship.create!(sender: Player.find(1), receiver: Player.find(2), active: false)


