class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render:new
    end
  end

  def show
  end

  def edit

  end

  def update

  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
