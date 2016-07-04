class TermsController < ApplicationController
  before_action :set_term, only: [:show, :update, :destroy]
  before_action :has_term?, only: :edit

  respond_to  :html

  def show
  end

  def new
    @term = Term.new
  end

  def edit
  end

  def create
    @term = Term.new(term_params)
    @term.build_councilor(person: current_user.person)
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
  def has_term?
    redirect_to new_term_path unless false # current_user.person.belongs_to_term?
  end

  def set_term
    @term = Term.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def term_params
    params.require(:term).permit(:section, :district, :political_party, :start_date, :end_date)
  end

end
