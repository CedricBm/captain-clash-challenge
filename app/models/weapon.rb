class Weapon < ActiveRecord::Base
  has_many :fighters

  validates :min_damage, :max_damage, numericality: {greater_than: 0}
  validate :max_damage_superior_to_min_damage

  def mean_damage
    (max_damage + min_damage) / 2
  end

  private

    def max_damage_superior_to_min_damage
      if max_damage < min_damage
        errors.add(:max_damage, "can't be inferior to min_damage: #{min_damage}")
      end
    end
end
