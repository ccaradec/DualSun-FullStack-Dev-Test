require "test_helper"

class InstallationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @installation = installations(:valid)
  end

  test "should get index" do
    get installations_url, as: :json
    assert_response :success
  end

  test "should create installation" do
    assert_difference('Installation.count') do
      post installations_url, params: { installation: @installation }, as: :json
    end

    assert_response 201
  end

  test "should return error on invalid creation" do
    @installation.city = nil
    assert_no_difference('Installation.count') do
      post installations_url, params: { installation: @installation }, as: :json
    end

    assert_response 422
  end

  test "should show installation" do
    get installation_url(@installation), as: :json
    assert_response :success
  end

  test "should update installation" do
    patch installation_url(@installation), params: { installation: @installation }, as: :json
    assert_response 200
  end

  test "should destroy installation" do
    assert_difference('Installation.count', -1) do
      delete installation_url(@installation), as: :json
    end

    assert_response 204
  end
end