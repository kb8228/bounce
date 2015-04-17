class Player < ActiveRecord::Base

  has_many :invitations

  attr_reader :password

  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def authenticate(unencrypted_password)
    if BCrypt::Password.new(self.password_digest) == unencrypted_password
      return self
    else
      return false
    end
  end

  # check this for validity!!!
  def matches
    Invitation.where.not(responder: nil).where(invitation[:player_id] == self[:id] || invitation[:responder] == self[:id])
  end

end
