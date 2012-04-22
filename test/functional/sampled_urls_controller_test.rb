require 'test_helper'

class SampledUrlsControllerTest < ActionController::TestCase
  setup do
    @sampled_url = sampled_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sampled_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sampled_url" do
    assert_difference('SampledUrl.count') do
      post :create, sampled_url: { query: @sampled_url.query, result_number: @sampled_url.result_number, url: @sampled_url.url }
    end

    assert_redirected_to sampled_url_path(assigns(:sampled_url))
  end

  test "should show sampled_url" do
    get :show, id: @sampled_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sampled_url
    assert_response :success
  end

  test "should update sampled_url" do
    put :update, id: @sampled_url, sampled_url: { query: @sampled_url.query, result_number: @sampled_url.result_number, url: @sampled_url.url }
    assert_redirected_to sampled_url_path(assigns(:sampled_url))
  end

  test "should destroy sampled_url" do
    assert_difference('SampledUrl.count', -1) do
      delete :destroy, id: @sampled_url
    end

    assert_redirected_to sampled_urls_path
  end
end
