class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image
      t.integer :years_played
      t.integer :num_matches
      t.boolean :doubles

      t.timestamps null: false
    end
  end
end
