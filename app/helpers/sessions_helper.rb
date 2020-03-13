# frozen_string_literal: true

# My comment

module SessionsHelper
  def sign_in(user_id)
    session[:user_id] = user_id
  end

  def current_user
    User.find(session[:user_id])
  end
end
