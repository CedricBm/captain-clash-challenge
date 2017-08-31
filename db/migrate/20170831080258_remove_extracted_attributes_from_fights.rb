class RemoveExtractedAttributesFromFights < ActiveRecord::Migration
  def change
    remove_column :fights, :winner_attributes
    remove_column :fights, :loser_attributes
  end
end
