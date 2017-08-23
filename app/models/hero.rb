class Hero < ActiveRecord::Base

  has_attached_file :avatar,
                    :styles => {:profile => "128x128#"},
                    :url => "/system/:class/:attachment/:id/:style/:updated_at/:hash.:extension",
                    :hash_secret => ENV['HERO_AVATAR_HASH_SECRET'],
                    :default_url => "/images/hero_avatar/missing_:style.jpg",
                    :preserve_firl => "true"
end
