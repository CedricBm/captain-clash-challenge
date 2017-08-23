class Hero < ActiveRecord::Base

  has_attached_file :avatar,
                    :styles => {:profile => "128x128#"},
                    :url => "/system/:class/:attachment/:id/:style/:updated_at/:hash.:extension",
                    :hash_secret => ENV['HERO_AVATAR_HASH_SECRET'],
                    :default_url => "/images/hero_avatar/missing_:style.jpg",
                    :preserve_firl => "true"
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png'], :message => "L'avatar doit être un png ou un jpeg"
  validates_attachment_file_name :avatar, :matches => [/png\Z/i, /jpe?g\Z/i], :message => "L'avatar doit être un png ou un jpeg"

  validates_with HeroValidator

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
