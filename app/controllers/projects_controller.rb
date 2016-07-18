class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :set_my_projects, only: [:show]

  respond_to  :html

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new(project_type: params[:project_type])
    @project.project_files.build
  end

  def edit
  end

  def show
  end

  def create
    @project = Project.new(project_params.merge(participation: current_user.participation))
    @project.save
    respond_with @project, location: -> { project_path  }
  end

  def update
    @project.update(project_params)
    respond_with @project
  end

  def destroy
    @project.destroy
    respond_with @project
  end

  def not_visible
    raise 3
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  def set_my_projects
    @projects = current_user.current_participation.projects
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description, :category, :project_type, :dossier, :dossier_url,
                                    project_files_attributes: [ :id, :name, :attachment, :_destroy ])
  end

end
