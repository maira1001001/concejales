class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy, :new_collaborator, :my_collaborators]

  respond_to :html

  def show
  end

  def new
    @participation = Participation.new
  end

  def edit
  end

  def create
    @participation = Participation.new(participation_params.merge(councilor: current_user))
    flash[:notice] = 'Datos cargados correctamente. Ya puede publicar proyectos.' if @participation.save
    respond_with @participation, location: root_path
  end

  def update
    @participation.update(participation_params)
    respond_with(@participation)
  end

  def destroy
    @participation.destroy
    respond_with(@participation)
  end

  def new_collaborator
    @user = @participation.collaborators.build
    respond_with @user
  end

  def my_collaborators
    @collaborators = @participation.collaborators
    respond_with @collaborators
  end

  private

  def set_participation
    raise 3
    @participation = Participation.find_by(councilor: current_user)
  end

  def participation_params
    params.require(:participation).permit(:start_date, :end_date, :in_function, :district_id, :political_party_id)
  end
end
