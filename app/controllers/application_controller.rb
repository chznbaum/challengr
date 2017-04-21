class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist

  private

      # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end

    def logged_in?
      !current_user.nil?
    end
end
