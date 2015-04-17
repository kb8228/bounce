class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :player, index: true
      t.string :location
      t.datetime :date

      t.timestamps null: false
    end
    add_foreign_key :invitations, :players
  end
end
