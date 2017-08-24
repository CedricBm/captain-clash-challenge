class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.text :winner_attributes
      t.text :loser_attributes

      t.timestamps null: false
    end

    add_index :fights, :winner_id
    add_index :fights, :loser_id
  end
end
