# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = User.create(name: "John", email: "jojo@hot.com", password: "jojo")
b = User.create(name: "Lan", email: "lala@hot.com", password: "lala")
c = User.create(name:  "Rose", email: "roro@hot.com", password: "roro")
d = User.create(name:  "Mook", email: "momo@hot.com", password: "momo")
e = User.create(name:  "Nene", email: "nene@hot.com", password: "nene")
User.create(name:  "Emma", email: "emem@hot.com", password: "emem")
User.create(name:  "Izzy", email: "iziz@hot.com", password: "iziz")
f = Category.create(name: "Arts")
g = Category.create(name: "Concerts&Festivals")
h = Category.create(name: "Food")
i= Event.create(name: "Rolling Loud", discription: "Roll Loud", category_id: g.id, created_by_id: a.id)
j = Event.create(name: "Diner 52", discription: "Eat a lot", category_id: h.id, created_by_id: b.id)
k = Event.create(name: "Habafest", discription: "Eat some beans", category_id: g.id, created_by_id: c.id)
l = Event.create(name: "Miami Basel", discription: "Too cool for you", category_id: f.id, created_by_id: a.id)
n= Event.create(name: "Armory Show", discription: "Cotemporary art for the masses", category_id: f.id, created_by_id: e.id)
o = Event.create(name: "Bluestone Cafe", discription: "Eat coffee with ice cream", category_id: h.id, created_by_id: d.id)
Event.create(name: "Beaux Art", discription: "Art from the 20th century gawke and enjoy", category_id: f.id, created_by_id: b.id)
Event.create(name: "Camp Flog Gnaw", discription: "We have a giant wheel that takes you high", category_id: g.id, created_by_id: a.id)
Rsvp.create(user_id: a.id, event_id: i.id)
Rsvp.create(user_id: a.id, event_id: i.id)
