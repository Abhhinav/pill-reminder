class MedicalHistoriesController < ApplicationController
  before_action :set_medical_history, only: [:show, :edit, :update, :destroy]
  before_action :validate_user!, except: [:index, :new, :create, :edit, :update, :show, :get_for_self, :get_for_dependants, :get_self_and_dependants]

  # GET /medical_histories
  def index
    @medical_histories = MedicalHistory.all

    render json: @medical_histories
  end

  # GET /medical_histories/1
  def show
    render json: @medical_history
  end

  # GET /medical_histories/1/edit
  def edit
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

  def get_for_self
    user_id = params[:user_id]

    # for today
    @medical_histories = MedicalHistory
          .where(user_id: user_id, dependant_id: nil)
          .order(:startdate, :asc)
    
    render json: @medical_histories
  end

  def get_for_dependants
    user_id = params[:user_id]
    @medical_histories = [];

    @medical_histories_today =  MedicalHistory
        .where.not(dependant_id: nil)
        .where(user_id: user_id)
        .where("? BETWEEN startdate AND enddate", DateTime.now.to_date)

    ids = []
    
    @medical_histories_today.all.map do |record|
      ids << record.dependant_id
    end

    @medical_history_tomorrow = MedicalHistory
      .where.not(dependant_id: nil)
      .where(user_id: user_id)
      .where("? BETWEEN startdate AND enddate",  DateTime.now.next_day.to_date)
      .where("dependant_id not in (?)", ids)
      .order(:startdate, :asc) 

    @medical_history_tomorrow = @medical_history_tomorrow || []
  
    @medical_histories = @medical_histories_today +  @medical_history_tomorrow

    render json: @medical_histories
  end

  # todo
  def get_self_and_dependants
    user_id = params[:user_id]
    @medical_histories = MedicalHistory.where(user_id: user_id)

    render json: @medical_histories
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_history
      @medical_history = MedicalHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medical_history_params
      params.require(:medical_history).permit(:illness, :drname, :medicine, :startdate, :enddate, :dosage_amount, :dosage_frequency, :dosage_time, :email_notify, :user_id, :dependant_id)
    end
end
