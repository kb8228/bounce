class FixDateInInvitations < ActiveRecord::Migration
  def change
    change_column :invitations, :date, :date
    add_column :invitations, :time, :time
  end
end
