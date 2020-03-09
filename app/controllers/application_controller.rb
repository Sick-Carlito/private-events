# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # attr_writer :current_user

  # helper_method :current_user
end
