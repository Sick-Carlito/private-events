class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :attendances # :foreign_key => :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, :class_name => "User"
  #has_many :invitations, :foreign_key => :inviting_event_id
  #has_many :invited_guests, through: :invitations, source: :invited

  scope :upcoming_events, -> { where('events.date >= ?', Date.today) }
  scope :past_events, -> { where('events.date < ?', Date.today) }

  # def upcoming?
  # 	#date && date.future?
  # 	date&.future?
  # end







end
