class User < ApplicationRecord
  has_secure_password
  has_many :events, :foreign_key => :creator_id, dependent: :destroy
  has_many :attendances
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze


  def upcoming_attended_events
    Event.where('date > ?', Time.now.to_date)
  end

  def past_attended_events
    Event.where('date < ?', Time.now.to_date)
  end


  validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX },
  #                                   uniqueness: {case_sensitive: false }



end