class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, except: [:fvalidate, :bvalidate]

  helper_method def logged_in?
    session[:user_id]
  end

  helper_method def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  helper_method def current_deck
    return unless session[:deck_id]
    @current_deck ||= Deck.find(session[:deck_id])
  end
end
