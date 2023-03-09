class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.integer :number_of_players

      t.timestamps
    end
  end
end
