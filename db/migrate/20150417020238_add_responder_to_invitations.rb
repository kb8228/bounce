class AddResponderToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :responder, :integer
  end
end
