class AddHeroHashToFighter < ActiveRecord::Migration
  def change
    add_column :fighters, :hero_attributes, :text
  end
end
