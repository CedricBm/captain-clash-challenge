class RemoveFightIdFromFighter < ActiveRecord::Migration
  def change
    remove_column :fighters, :fight_id
  end
end
