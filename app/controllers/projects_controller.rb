class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :not_visible, :visible]

  respond_to  :html

  def index
    @all_visible_projects = Project.visible.page(page_params)
    respond_with(@all_visible_projects)
  end

  def my_projects
    @projects = Project.all_from_current_participation(current_user.participation).page(page_params)
  end

  def new
    @project = Project.new(project_type: params[:project_type])
    @project.project_files.build
  end

  def edit
  end

  def create
    @project = Project.new(project_params.merge(participation: current_user.participation))
    @project.save
    respond_with @project, location: -> { my_projects_path  }
  end

  def update
    @project.update(project_params)
    respond_with @project, location: -> { my_projects_path }
  end

  def destroy
    @project.destroy
    respond_with @project
  end

  def not_visible
    @project.not_visible
    respond_with @project, location: my_projects_path
  end

  def visible
    @project.visible
    respond_with @project, location: my_projects_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:title, :description, :category, :project_type, :dossier, :dossier_url,
                                    project_files_attributes: [ :id, :name, :attachment, :_destroy ])
  end

end
