class Invitation < ActiveRecord::Base
  belongs_to :player
  belongs_to :responder, :class_name => "Player"

  validates :location, presence: true
  validates :date, presence: true
  validates :time, presence: true
  
end
