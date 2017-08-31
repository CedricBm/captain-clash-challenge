class Fighter < ActiveRecord::Base
  belongs_to :hero
  belongs_to :weapon
  belongs_to :shield
  belongs_to :fight
end
