class Fight < ActiveRecord::Base
  private_class_method :new, :create

  belongs_to :winner, class_name: "Fighter", foreign_key: "winner_id"
  belongs_to :loser, class_name: "Fighter", foreign_key: "loser_id"

  has_many :fight_events

  def self.fight_between(fighter_one, fighter_two)
    fight = new
    winner, loser = fight.generate_fight_events(fighter_one, fighter_two)

    fight.winner = winner
    fight.loser = loser
    fight.save

    fight
  end

  def generate_fight_events(fighter_one, fighter_two)
    first_fighter, second_fighter = detect_order_of_attacks(fighter_one, fighter_two)

    while first_fighter.health > 0 && second_fighter.health > 0 do
      self.fight_events << first_fighter.attack_against(second_fighter)
      self.fight_events << second_fighter.attack_against(first_fighter) unless second_fighter.health == 0
    end

    detect_winner_and_loser(first_fighter, second_fighter)
  end

  private

    #data_clump ?
    def detect_order_of_attacks(fighter_one, fighter_two)
      if fighter_one.speed >= fighter_two.speed
        [fighter_one, fighter_two]
      else
        [fighter_two, fighter_one]
      end
    end

    #data_clump ?
    def detect_winner_and_loser(first_fighter, second_fighter)
      if first_fighter.health > 0
        [first_fighter, second_fighter]
      else
        [second_fighter, first_fighter]
      end
    end

end
