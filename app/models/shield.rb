class Shield < ActiveRecord::Base
  has_many :fighters

  validates :armor, numericality: {greater_than: 0}
end
