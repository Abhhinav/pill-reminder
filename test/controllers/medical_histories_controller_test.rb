require 'test_helper'

class MedicalHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_history = medical_histories(:one)
  end

  test "should get index" do
    get medical_histories_url, as: :json
    assert_response :success
  end

  test "should create medical_history" do
    assert_difference('MedicalHistory.count') do
      post medical_histories_url, params: { medical_history: { dosage_amount: @medical_history.dosage_amount, dosage_frequency: @medical_history.dosage_frequency, dosage_time: @medical_history.dosage_time, drname: @medical_history.drname, email_notify: @medical_history.email_notify, enddate: @medical_history.enddate, illness: @medical_history.illness, medicine: @medical_history.medicine, startdate: @medical_history.startdate } }, as: :json
    end

    assert_response 201
  end

  test "should show medical_history" do
    get medical_history_url(@medical_history), as: :json
    assert_response :success
  end

  test "should update medical_history" do
    patch medical_history_url(@medical_history), params: { medical_history: { dosage_amount: @medical_history.dosage_amount, dosage_frequency: @medical_history.dosage_frequency, dosage_time: @medical_history.dosage_time, drname: @medical_history.drname, email_notify: @medical_history.email_notify, enddate: @medical_history.enddate, illness: @medical_history.illness, medicine: @medical_history.medicine, startdate: @medical_history.startdate } }, as: :json
    assert_response 200
  end

  test "should destroy medical_history" do
    assert_difference('MedicalHistory.count', -1) do
      delete medical_history_url(@medical_history), as: :json
    end

    assert_response 204
  end
end
