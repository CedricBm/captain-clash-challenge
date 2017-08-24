class Fight < ActiveRecord::Base
  private_class_method :new, :create
  serialize [:winner_attributes, :loser_attributes]

  belongs_to :winner, class_name: "Hero", foreign_key: "winner_id"
  belongs_to :loser, class_name: "Hero", foreign_key: "loser_id"

  has_many :fight_events

  def self.fight_between(hero_one, hero_two)
    fight = new
    winner, loser = fight.generate_fight_events(hero_one, hero_two)

    fight.winner = winner
    fight.loser = loser
    fight.winner_attributes = winner.to_hash
    fight.loser_attributes = loser.to_hash
    fight.save

    fight
  end

  def generate_fight_events(hero_one, hero_two)
    first_hero, second_hero = detect_order_of_attacks(hero_one, hero_two)

    while first_hero.health > 0 && second_hero.health > 0 do
      self.fight_events << first_hero.attack_against(second_hero)
      self.fight_events << second_hero.attack_against(first_hero) unless second_hero.health == 0
    end

    detect_winner_and_loser(first_hero, second_hero)
  end

  private

    def detect_order_of_attacks(hero_one, hero_two)
      if hero_one.speed >= hero_two.speed
        [hero_one, hero_two]
      else
        [hero_two, hero_one]
      end
    end

    def detect_winner_and_loser(first_hero, second_hero)
      if first_hero.health > 0
        [first_hero, second_hero]
      else
        [second_hero, first_hero]
      end
    end

end
