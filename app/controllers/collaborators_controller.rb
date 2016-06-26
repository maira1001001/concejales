class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @collaborators = Collaborator.all
    respond_with(@collaborators)
  end

  def show
    respond_with(@collaborator)
  end

  def new
    @collaborator = Collaborator.new
    respond_with(@collaborator)
  end

  def edit
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    @collaborator.save
    respond_with(@collaborator)
  end

  def update
    @collaborator.update(collaborator_params)
    respond_with(@collaborator)
  end

  def destroy
    @collaborator.destroy
    respond_with(@collaborator)
  end

  private
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    def collaborator_params
      params[:collaborator]
    end
end
