class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :health
      t.integer :attack
      t.integer :speed, default: 5
      t.integer :dodge_rate, default: 0
      t.integer :critical_rate, default: 0
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
