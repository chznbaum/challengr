module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        super || guest_user
    end

    def guest_user
        OpenStruct.new(name: "Guest",
        first_name: "Guest",
        last_name: "Guest",
        username: "Guest",
        email: "guest@challengr.com"
        )
    end

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