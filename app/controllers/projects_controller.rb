class ProjectsController < ApplicationController
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = @user.projects.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to user_projects_path, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to user_projects_path, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_path, notice: 'Project was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.friendly.find(params[:user_id])
    end

    def set_project
      @project = Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :subtitle, :description, :main_image, :thumb_image, :source_link, :view_link, :user_id)
    end
end
