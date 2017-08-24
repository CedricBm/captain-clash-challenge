class HeroValidator < ActiveModel::Validator
  def validate(hero)
    validates_presence_of_attributes(hero)

    unless hero.errors.any?
      validates_range_of_attributes(hero)
    end
  end

  private

    def validates_presence_of_attributes(hero)
      hero.errors[:name] << "cannot be blank" if hero.name.blank?
      hero.errors[:health] << "cannot be blank" if hero.health.blank?
      hero.errors[:attack] << "cannot be blank" if hero.attack.blank?
      hero.errors[:speed] << "cannot be blank" if hero.speed.blank?
      hero.errors[:dodge_rate] << "cannot be blank" if hero.dodge_rate.blank?
      hero.errors[:critical_rate] << "cannot be blank" if hero.critical_rate.blank?
    end

    def validates_range_of_attributes(hero)
      hero.errors[:health] << "cannot be negative" if hero.health < 0
      hero.errors[:attack] << "cannot be negative" if hero.attack < 0
      hero.errors[:speed] << "cannot be negative" if hero.speed < 0
      hero.errors[:dodge_rate] << "must be between 0 and #{ENV['MAX_DODGE_RATE']}" if hero.dodge_rate < 0 || hero.dodge_rate > ENV['MAX_DODGE_RATE'].to_i
      hero.errors[:critical_rate] << "must be between 0 and #{ENV['MAX_CRITICAL_RATE']}" if hero.critical_rate < 0 || hero.critical_rate > ENV['MAX_CRITICAL_RATE'].to_i
    end
end