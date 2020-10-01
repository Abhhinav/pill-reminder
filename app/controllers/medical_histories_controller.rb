class MedicalHistoriesController < ApplicationController
  before_action :set_medical_history, only: [:show, :update, :destroy]

  # GET /medical_histories
  def index
    @medical_histories = MedicalHistory.all

    render json: @medical_histories
  end

  # GET /medical_histories/1
  def show
    render json: @medical_history
  end

  # POST /medical_histories
  def create
    @medical_history = MedicalHistory.new(medical_history_params)

    if @medical_history.save
      render json: @medical_history, status: :created, location: @medical_history
    else
      render json: @medical_history.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medical_histories/1
  def update
    if @medical_history.update(medical_history_params)
      render json: @medical_history
    else
      render json: @medical_history.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medical_histories/1
  def destroy
    @medical_history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_history
      @medical_history = MedicalHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medical_history_params
      params.require(:medical_history).permit(:illness, :drname, :medicine, :startdate, :enddate, :dosage_amount, :dosage_frequency, :dosage_time, :email_notify)
    end
end
