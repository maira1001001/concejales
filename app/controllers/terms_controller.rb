class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  respond_to  :html

  def my_term
    @participation = Participation.my_participation(current_user.person)
    @term = Term.my_term(@participation)
    render 'index'
  end

  def show
  end

  def new
    @project = Project.new(project_type: params[:project_type])
    @project.project_files.build
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    respond_with @project
  end

  def update
    @project.update(project_params)
    respond_with @project
  end

  def destroy
    @project.destroy
    respond_with @project
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
                                    :category,
                                    :project_type,
                                    project_files_attributes: [ :id, :name, :attachment, :_destroy ] )
  end

end
