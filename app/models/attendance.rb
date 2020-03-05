class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event


  # scope :upcoming_attended_events, lambda { |user_id|
  # 							joins(:event).where('attendances.user_id = ?
  # 								and events.date >= ?' , user_id, Date.today)}

  # scope :past_attended_events, lambda { |user_id|
  # 							joins(:event).where('attendances.user_id = ?
  # 								and events.date < ?' , user_id, Date.today)}



end
