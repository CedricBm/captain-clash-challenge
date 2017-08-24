class CreateFightEvents < ActiveRecord::Migration
  def change
    create_table :fight_events do |t|
      t.integer :fight_id

      t.string :attacker_name
      t.integer :attack_type
      t.integer :attack_damage

      t.string :defender_name
      t.integer :defend_type
      t.integer :defender_health

      t.timestamps null: false
    end

    add_index :fight_events, :fight_id
  end
end
