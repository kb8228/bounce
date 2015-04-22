class RemoveResponderFromInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :responder, :integer
  end
end
