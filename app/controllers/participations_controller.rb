class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy, :new_collaborator]

  respond_to :html

  def index
    @participations = Participations.all
  end

  def show
  end

  def new
    @participation = Participation.new
  end

  def edit
    @participation.build_charge
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
    @pariticipation.destroy
    respond_with(@participation)
  end

  def new_collaborator
    @collaborator = Participation.find_by(councilor: current_user).collaborators.build
  end

  private

  def set_participation
    @pariticipation = Participation.find_by(councilor: current_user)
  end

  def participation_params
    params.require(:participation).permit(:start_date, :end_date, :in_function, :district_id, :political_party_id)
  end
end
