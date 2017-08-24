class Fight < ActiveRecord::Base
  serialize [:winner_attributes, :loser_attributes], Hash

  belongs_to :winner, class_name: "Hero", foreign_key: "winner_id"
  belongs_to :loser, class_name: "Hero", foreign_key: "loser_id"

  has_many :fight_events
end
