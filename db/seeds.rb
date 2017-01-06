# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
comedy = Category.create(name: "TV Comedy")
drama = Category.create(name: "TV Drama")

Video.create(title: "Futurama", description: "Futurama is DOOOPE!", small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedy)
Video.create(title: "South Park", description: "South Park is pretty chilled.", small_cover_url: "/tmp/south_park.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedy)
Video.create(title: "Monk", description: "Monk literally stinks.", small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: drama)
Video.create(title: "Family Guy", description: "Family Guy is a funny show also.", small_cover_url: "/tmp/family_guy.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedy)

User.create(email: 'someone@example.com', full_name: "Steve Smith", password: "password")