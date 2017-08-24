class AddPowerAndRankToHeroes < ActiveRecord::Migration
  def change
    add_column :heros, :power, :integer
    add_column :heros, :rank, :integer
  end
end
