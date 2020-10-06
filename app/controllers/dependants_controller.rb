class DependantsController < ApplicationController
  before_action :set_dependant, only: [:show, :edit, :update, :destroy]
  before_action :validate_user!, except: [:index, :new, :create, :edit, :update, :show, :user_deps]

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

  #GET /dependants/:id/deps
  def user_deps
    user_id = params[:user_id]

    @dependants = Dependant
          .where(user_id: user_id)
          .order(:startdate, :asc)
    
    render json: @dependants
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
