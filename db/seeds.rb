100.times do
  hero_name = Faker::Name.name

  Hero.create! name: hero_name,
               health: 100 + Random.rand(49999),
               attack: 100 + Random.rand(999),
               speed: Random.rand(10),
               dodge_rate: Random.rand(ENV['MAX_DODGE_RATE'].to_i),
               critical_rate: Random.rand(ENV['MAX_CRITICAL_RATE'].to_i)
end

Weapon.create! name: "Justifier", min_damage: 10, max_damage: 20
Weapon.create! name: "Treachery", min_damage: 51, max_damage: 78
Weapon.create! name: "Purifier", min_damage: 160, max_damage: 210
Weapon.create! name: "Hailstorm Slicer", min_damage: 341, max_damage: 350
Weapon.create! name: "Whistling Broadsword", min_damage: 10, max_damage: 500
Weapon.create! name: "Hopeless Skeletal Blade", min_damage: 600, max_damage: 600

Shield.create! name: "Trainee's Greatshield", armor: 10
Shield.create! name: "Undead Light Shield", armor: 100
Shield.create! name: "Champion Redwood Blockade", armor: 300
Shield.create! name: "Doom's Willow Tower Shield", armor: 500
