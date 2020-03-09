# frozen_string_literal: true

# My comment

class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
