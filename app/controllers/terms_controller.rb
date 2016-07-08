class TermsController < ApplicationController
  before_action :has_term?, only: :show
  before_action :set_term, only: [:show, :update, :destroy]
#  before_action :set_term, only: [:edit, :update, :destroy]
#  before_action :has_participation?

  respond_to  :html

  def show
  end

  def new
    @term = Term.new
    @term.build_councilor(person: current_user.person)
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

  def has_term?
    redirect_to new_term_path unless current_user.person.belongs_to_term?
  end

  def set_term
    @term = Term.find(params[:id])
  end

  def term_params
    params.require(:term).permit(:district_id, :political_party_id, :start_date, :end_date)
  end

end
