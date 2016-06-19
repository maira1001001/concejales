class CouncilorsController < ApplicationController
  before_action :set_councilor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @councilors = Councilor.all
    respond_with(@councilors)
  end

  def show
    respond_with(@councilor)
  end

  def new
    @councilor = Councilor.new
    respond_with(@councilor)
  end

  def edit
  end

  def create
    @councilor = Councilor.new(councilor_params)
    @councilor.save
    respond_with(@councilor)
  end

  def update
    @councilor.update(councilor_params)
    respond_with(@councilor)
  end

  def destroy
    @councilor.destroy
    respond_with(@councilor)
  end

  private
    def set_councilor
      @councilor = Councilor.find(params[:id])
    end

    def councilor_params
      params[:councilor]
    end
end
