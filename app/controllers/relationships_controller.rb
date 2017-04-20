class RelationshipsController < ApplicationController
    before_action :logged_in_user

    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        redirect_to user
    end
    
    def destroy
        user = Relationship.find(params[:id]).followed
        current_user.unfollow(user)
        redirect_to user
    end

    private

    # Confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

     # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def logged_in?
      !current_user.nil?
    end
end