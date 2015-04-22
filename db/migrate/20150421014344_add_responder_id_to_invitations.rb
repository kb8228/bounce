class AddResponderIdToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :responder_id, :integer
  end
end
