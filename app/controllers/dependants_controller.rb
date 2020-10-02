class DependantsController < ApplicationController
  before_action :set_dependant, only: [:show, :edit, :update, :destroy]
  before_action :validate_user!, except: [:index, :new, :create, :edit, :update, :show]

  # GET /dependants
  def index
    @dependants = Dependant.all

    render json: @dependants
  end

  # GET /dependents/1/edit
  def edit
  end

  # GET /dependants/1
  def show
    render json: @dependant
  end

  # POST /dependants
  def create
    @dependant = Dependant.new(dependant_params)

    if @dependant.save
      render json: @dependant, status: :created, location: @dependant
    else
      render json: @dependant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dependants/1
  def update
    if @dependant.update(dependant_params)
      render json: @dependant
    else
      render json: @dependant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dependants/1
  def destroy
    @dependant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dependant
      @dependant = Dependant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dependant_params
      params.require(:dependant).permit(:relationship, :name, :email, :contact, :bloodgroup, :dob, :weight, :height, :user_id)
    end
end
