# frozen_string_literal: true

module SessionsHelper
  def signed_in?
    !session[:creator_id].nil?
  end

  def current_user
    signed_in? ? User.find(session[:creator_id]) : nil
  end
end
