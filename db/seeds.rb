100.times do
  hero_name = Faker::Name.name

  Hero.create! name: hero_name,
               health: 100 + Random.rand(49999),
               attack: 100 + Random.rand(999),
               speed: Random.rand(10),
               dodge_rate: Random.rand(ENV['MAX_DODGE_RATE'].to_i),
               critical_rate: Random.rand(ENV['MAX_CRITICAL_RATE'].to_i)
end