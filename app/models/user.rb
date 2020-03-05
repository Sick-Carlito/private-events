class User < ApplicationRecord
  has_secure_password
  has_many :events, :foreign_key => :creator_id, dependent: :destroy
  has_many :attendances #:foreign_key => :attendee_id, dependent: :destroy
  #has_many :attended_events, through: :attendances, source: :attended_event
  #has_many :invitations, :foreign_key => :invited_id
  #has_many :inviting_events, through: :invitations, source: :inviting_event


  # def upcoming_attended_events(event)
  # 	events.include? event
  # end

  # def past_attended_events(event)
  # 	attended_events.include? event
  # end

  # def attend(event)
  #   attended_events.push event
  # end

  # def leave_event(event)
  #   attended_events.delete event
  # end

=begin
  def invite(user, event)
    event.invited_guests << user unless event.invited_guests.include?(user)
  end
=end

  # def attend(event)
  #   attended_events << event unless attended_events.include?(event)
    
  # end

  def upcoming_attended_events
    Event.where('date > ?', Time.now.to_date)
  end

  def past_attended_events
    Event.where('date < ?', Time.now.to_date)
  end



end