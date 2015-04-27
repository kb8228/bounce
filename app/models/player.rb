class Player < ActiveRecord::Base
  has_many :invitations, dependent: :destroy
  mount_uploader :image, ImageUploader
  
  attr_reader :password
  before_save :format_player_input

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
  def responses
    Invitation.where.not(responder: nil).where(player: self)
  end

  def accepted
    Invitation.where(responder: self)
  end

  def pending
    Invitation.where(responder: nil).where(player: self)
  end

  def open_invitations
    Invitation.where.not(player: self).where(responder: nil)
  end

  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, confirmation: true, length: { in: 6..20 }, on: :create
  
  private
  def format_player_input
    self.username = self.username.titleize
    self.email = self.email.downcase
  end

end
