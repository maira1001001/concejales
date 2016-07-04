class TermsController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]
  before_action :has_participation

  respond_to  :html

  def show
  end

  ##TODO : asi no se crea. se crea como @term.build_councilor ....
  def new
    @term = Term.new
    @term.build_district
    @term.build_political_party
    participation = Participation.new(person: current_user.person, role: 'councilor')
    @term.councilor = participation
  end

  def edit
  end

  def create
    @term = Term.new(term_params)
    @term.save
    respond_with @term
  end

  def update
    @term.update(term_params)
    respond_with @term
  end

  def destroy
    @term.destroy
    respond_with @term
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_term
    @term = Term.find(params[:id])
  end

  def has_participation?
    redirect_to term_path(@term) if councilor.has_participation?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def term_params
    params.require(:term).permit(:section, :district, :political_party, :start_date, :end_date)
  end

end
