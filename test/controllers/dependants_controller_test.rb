require 'test_helper'

class DependantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dependant = dependants(:one)
  end

  test "should get index" do
    get dependants_url, as: :json
    assert_response :success
  end

  test "should create dependant" do
    assert_difference('Dependant.count') do
      post dependants_url, params: { dependant: { bloodgroup: @dependant.bloodgroup, contact: @dependant.contact, dob: @dependant.dob, email: @dependant.email, height: @dependant.height, name: @dependant.name, relationship: @dependant.relationship, weight: @dependant.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show dependant" do
    get dependant_url(@dependant), as: :json
    assert_response :success
  end

  test "should update dependant" do
    patch dependant_url(@dependant), params: { dependant: { bloodgroup: @dependant.bloodgroup, contact: @dependant.contact, dob: @dependant.dob, email: @dependant.email, height: @dependant.height, name: @dependant.name, relationship: @dependant.relationship, weight: @dependant.weight } }, as: :json
    assert_response 200
  end

  test "should destroy dependant" do
    assert_difference('Dependant.count', -1) do
      delete dependant_url(@dependant), as: :json
    end

    assert_response 204
  end
end
