class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def home
    @projects = Project.all
    @pledges = Pledge.all

  end

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)

    @project.user = current_user
    if @project.save
      redirect_to projects_url
    else
      flash.now[:alert] = @project.errors.full_messages.first
      render :new
    end
   end

   private

   def project_params
     params.require(:project).permit(:title,:description,:goal,:image,:start_date,:end_date)
   end

end
