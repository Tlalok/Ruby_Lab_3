# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

belarus = Country.create(name: "Belarus")
russia  = Country.create(name: "Russia")
ukrain  = Country.create(name: "Ukrain")
china   = Country.create(name: "China")

Comment.create(commentable: belarus, body: "Belarus comment 1")
Comment.create(commentable: belarus, body: "Belarus comment 2")
Comment.create(commentable: russia,  body: "Russia comment 1")
Comment.create(commentable: china,   body: "China comment 1")

minsk  = Town.create(name: "Minsk",  country_id: belarus.id)
moscow = Town.create(name: "Moscow", country_id: russia.id)
kyiv   = Town.create(name: "Kyiv",   country_id: ukrain.id)
pekin  = Town.create(name: "Pekin",  country_id: china.id)

Comment.create(commentable: minsk, body: "Minsk comment 1")
Comment.create(commentable: minsk, body: "Minsk comment 2")
Comment.create(commentable: moscow,  body: "Moscow comment 1")
Comment.create(commentable: pekin,   body: "Pekin comment 1")

minsk_2       = Airport.create(name: "Minsk-2",      town_id: minsk.id, place_count: 50)
sheremetyevo  = Airport.create(name: "Sheremetyevo", town_id: moscow.id, place_count: 80)
kyiv_airport  = Airport.create(name: "Kyiv",         town_id: kyiv.id, place_count: 70)
pekin_airport = Airport.create(name: "Pekin",        town_id: pekin.id, place_count: 150)

plane_1 = Plane.create(name: "Plane 1", place_count: 150)
plane_2 = Plane.create(name: "Plane 2", place_count: 170)
plane_3 = Plane.create(name: "Plane 3", place_count: 120)
plane_4 = Plane.create(name: "Plane 4", place_count: 110)

ivanov = User.create(name: "Ivan",  second_name: "Ivanov", password: "password_ivanov", phone: "+375 29 136-54-45", email: "Ivanov@gmail.com")
petrov = User.create(name: "Peter", second_name: "Petrov", password: "password_petrov", phone: "+375 29 296-14-36", email: "Petrov@gmail.com")
smith  = User.create(name: "John",  second_name: "Smith",  password: "password_smith",  phone: "+375 29 634-81-07", email: "Smith@gmail.com")

trip_ivanov_1 = Trip.create(
  time_out: DateTime.strptime('03-02-2018 06:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('03-02-2018 09:30:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_1.id,
  airport_from_id: minsk_2.id,
  airport_to_id: sheremetyevo.id
)

trip_ivanov_2 = Trip.create(
  time_out: DateTime.strptime('04-03-2018 12:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('04-03-2018 15:15:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_2.id,
  airport_from_id: sheremetyevo.id,
  airport_to_id: kyiv_airport.id
)

trip_ivanov_3 = Trip.create(
  time_out: DateTime.strptime('16-03-2018 11:40:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('16-03-2018 16:15:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_3.id,
  airport_from_id: kyiv_airport.id,
  airport_to_id: pekin_airport.id
)

trip_ivanov_4 = Trip.create(
  time_out: DateTime.strptime('30-03-2018 09:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('30-03-2018 14:55:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_4.id,
  airport_from_id: pekin_airport.id,
  airport_to_id: sheremetyevo.id
)

ivanov.trips << trip_ivanov_1
ivanov.trips << trip_ivanov_2
ivanov.trips << trip_ivanov_3
ivanov.trips << trip_ivanov_4


trip_petrov_1 = Trip.create(
  time_out: DateTime.strptime('06-03-2018 16:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('06-03-2018 18:30:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_1.id,
  airport_from_id: kyiv_airport.id,
  airport_to_id: sheremetyevo.id
)

trip_petrov_2 = Trip.create(
  time_out: DateTime.strptime('14-03-2018 08:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('14-03-2018 15:15:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_2.id,
  airport_from_id: sheremetyevo.id,
  airport_to_id: pekin_airport.id
)

trip_petrov_3 = Trip.create(
  time_out: DateTime.strptime('18-03-2018 11:40:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('18-03-2018 16:15:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_3.id,
  airport_from_id: pekin_airport.id,
  airport_to_id: sheremetyevo.id
)

petrov.trips << trip_petrov_1
petrov.trips << trip_petrov_2
petrov.trips << trip_petrov_3

trip_smith_1 = Trip.create(
  time_out: DateTime.strptime('28-03-2018 09:30:00', '%d-%m-%Y %H:%M:%S'),
  time_in: DateTime.strptime('28-03-2018 14:55:00', '%d-%m-%Y %H:%M:%S'),
  plane_id: plane_4.id,
  airport_from_id: sheremetyevo.id,
  airport_to_id: pekin_airport.id
)

smith.trips << trip_smith_1