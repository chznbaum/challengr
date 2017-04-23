class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_create :default_role

  def profile
    @user = User.find(current_user)
    @user_posts = @user.blogs.paginate(page: params[:page], :per_page => 3)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user_posts = @user.blogs.paginate(page: params[:page], :per_page => 3)
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{@user.username} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def following
    @title = "Following"
    @user = User.friendly.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def default_role
      Assignment.create!(
        user_id: current_user.id,
        role_id: 1
      )
    end

    def set_user
      @user = User.friendly.find(params[:id])
    end

     # Confirms the correct user
    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end

    def set_blog
      @blog = @user.blogs.friendly.find(params[:blog_id])
    end
end
