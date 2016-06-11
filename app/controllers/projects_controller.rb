class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to  :html

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
    @project.project_files.build
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    raise 3
    @project.save
    respond_with @project
   end

  def update
    @project.update(project_params)
    respond_with @project
  end

  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title,
                                      :description,
                                      :district_id,
                                      :dossier,
                                      :category,
                                      project_files_attributes: [ :id, :name, :attachment, :_destroy ] )
    end
end
