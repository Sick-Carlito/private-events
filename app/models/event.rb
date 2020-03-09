# frozen_string_literal: true

# My comment

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, class_name: 'User'

  scope :upcoming_events, -> { where('events.date >= ?', Date.today) }
  scope :past_events, -> { where('events.date < ?', Date.today) }

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
