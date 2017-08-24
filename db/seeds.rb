100.times do
  hero_name = Faker::Name.name

  Hero.create! name: hero_name,
               health: 100 + Random.rand(49999),
               attack: 100 + Random.rand(999),
               speed: Random.rand(10),
               dodge_rate: Random.rand(30),
               critical_rate: Random.rand(100)
end