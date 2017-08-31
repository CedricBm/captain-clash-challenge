class Fighter < ActiveRecord::Base
  serialize :hero_attributes, Hash

  belongs_to :hero
  belongs_to :weapon
  belongs_to :shield

  has_one :win, class_name: "Fight", foreign_key: "winner_id"
  has_one :loss, class_name: "Fight", foreign_key: "loser_id"

  before_create :hash_hero_attributes

  delegate :name, :health, :attack, :speed, :dodge_rate, :critical_rate, :power, :rank, to: :hero

  def attack_against(enemy_fighter)
    damage, attack_type = determine_damage
    health, defend_type = enemy_fighter.determine_defense(damage)

    FightEvent.create(attacker_name: name,
                      attack_type: attack_type,
                      attack_damage: damage,
                      defender_name: enemy_fighter.name,
                      defend_type: defend_type,
                      defender_health: health)
  end

  # I could extract the return of this function into an object #data_clump
  def determine_damage
    if Random.rand(100) < critical_rate
      [fighter_attack * 2, FightEvent.attack_types['critical']]
    else
      [fighter_attack, FightEvent.attack_types['normal']]
    end
  end

  #data_clump
  def determine_defense(damage)
    damage = difference_or_zero_if_negative(damage, fighter_defense)

    if Random.rand(100) < dodge_rate
      [health, FightEvent.defend_types['dodge']]
    else
      self.hero.health = difference_or_zero_if_negative(health, damage)
      [health, FightEvent.defend_types['receive']]
    end
  end

  private

    def hash_hero_attributes
      self.hero_attributes = self.hero.to_hash
    end

    def difference_or_zero_if_negative(amount, substract)
      amount > substract ? amount - substract : 0
    end

    def fighter_attack
      attack + (self.weapon&.bonus_attack_provided).to_i
    end

    def fighter_defense
      (self.shield&.armor).to_i
    end
end
