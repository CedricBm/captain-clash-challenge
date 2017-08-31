class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.references :hero, index: true, foreign_key: true
      t.references :weapon, index: true, foreign_key: true
      t.references :shield, index: true, foreign_key: true
      t.references :fight, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
