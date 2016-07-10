class ChargesController < ApplicationController
  before_action :has_charge?, only: :show
  before_action :set_charge, only: [:show, :update, :destroy]
#  before_action :set_term, only: [:edit, :update, :destroy]
#  before_action :has_participation?

  respond_to  :html

  def show
  end

  def new
    @charge = Charge.new
    @charge.build_councilor(person: current_user.person)
  end

  def edit
  end

  def create
    @charge = Charge.new(charge_params)
    @charge.councilor = Participation.new(person: current_user.person)
    @charge.save
    respond_with @charge
  end

  def update
    @charge.update(charge_params)
    respond_with @charge
  end

  def destroy
    @charge.destroy
    respond_with @charge
  end

  private

  def has_charge?
    redirect_to new_charge_path unless current_user.person.belongs_to_charge?
  end

  def set_charge
    @charge = Charge.find(current_user.person_id)
  end

  def charge_params
    params.require(:charge).permit(:district_id, :political_party_id, :start_date, :end_date, :in_function)
  end

end
