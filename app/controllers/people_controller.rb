class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @people = Person.all
    respond_with(@people)
  end

  def new
    @person = Person.new
    @person.build_participation
    respond_with(@person)
  end

  def edit
    @person.build_participation
  end

  def create
    @person = Person.new(person_params)
    @person.save
    respond_with(@person)
  end

  def update
    @person.update(person_params)
    redirect_to root_path
  end

  def destroy
    @person.destroy
    respond_with(@person)
  end

  private
  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :last_name, :current_district_id)
  end
end
