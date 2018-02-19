Country.destroy_all

@norway = Country.create(name: "Norway")
@sweden = Country.create(name: "Sweden")
@denmark = Country.create(name: "Denmark")
@finland = Country.create(name: "Finland")
@greece = Country.create(name: "Greece")

City.create(name: "Oslo", country: @norway)
City.create(name: "Bergen", country: @norway)
City.create(name: "Trondheim", country: @norway)

City.create(name: "Stockholm", country: @sweden)
City.create(name: "Malmo", country: @sweden)
City.create(name: "Gotenborg", country: @sweden)

City.create(name: "Copenhagen", country: @denmark)
City.create(name: "Aarhus", country: @denmark)

City.create(name: "Helsinki", country: @finland)
City.create(name: "Turku", country: @finland)