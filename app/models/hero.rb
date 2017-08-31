class Hero < ActiveRecord::Base
  validates_with HeroValidator

  has_many :fighters
  has_many :wins, through: :fighters
  has_many :losses, through: :fighters

  has_attached_file :avatar,
                    :styles => {:profile => "128x128#"},
                    :url => "/system/:class/:attachment/:id/:style/:updated_at/:hash.:extension",
                    :hash_secret => ENV['HERO_AVATAR_HASH_SECRET'],
                    :default_url => "/images/hero_avatar/missing_:style.jpg",
                    :preserve_firl => "true"
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'], :message => "L'avatar doit être un png ou un jpeg"
  validates_attachment_file_name :avatar, :matches => [/png\Z/i, /jpe?g\Z/i], :message => "L'avatar doit être un png ou un jpeg"

  before_save :compute_power_and_rank


  def to_param
    "#{id}-#{name.parameterize}"
  end

  def to_hash
    {name: self.name, health: self.health, attack: self.attack, speed: self.speed, dodge_rate: self.dodge_rate, critical_rate: self.critical_rate}
  end

  def compute_power_and_rank
    self.power = self.health + self.attack
    self.power += self.health * (self.dodge_rate / 100.0)
    self.power += self.attack * (self.critical_rate / 100.0)

    self.rank = self.power.to_i.to_s.length
  end

  def self.get_rank(rank)
    Hero.where(rank: rank).order(power: :desc)
  end

end
