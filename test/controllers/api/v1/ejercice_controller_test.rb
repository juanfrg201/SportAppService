require "test_helper"

class Api::V1::EjerciceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_ejercice_create_url
    assert_response :success
  end

  test "should get index" do
    get api_v1_ejercice_index_url
    assert_response :success
  end
end
