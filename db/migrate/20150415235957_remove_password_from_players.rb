class RemovePasswordFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :password, :string
  end
end
