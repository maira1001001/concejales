class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @participations = Participations.all
  end

  def show
  end

  def new
    @participation = Participation.new
    @participation.build_term
  end

  def edit
    @participation.build_term
  end

  def create
    @participation = Person.new(participation_params)
    @participation.save
    respond_with(@participation)
  end

  def update
    @participation.update(participation_params)
    respond_with(@participation)
  end

  def destroy
    @pariticipation.destroy
    respond_with(@participation)
  end

  private
    def set_participation
      @pariticipation = Person.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:start_date, :end_date)
    end
end
