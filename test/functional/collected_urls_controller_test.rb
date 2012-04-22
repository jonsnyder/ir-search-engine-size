require 'test_helper'

class CollectedUrlsControllerTest < ActionController::TestCase
  setup do
    @collected_url = collected_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collected_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collected_url" do
    assert_difference('CollectedUrl.count') do
      post :create, collected_url: { url: @collected_url.url }
    end

    assert_redirected_to collected_url_path(assigns(:collected_url))
  end

  test "should show collected_url" do
    get :show, id: @collected_url
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collected_url
    assert_response :success
  end

  test "should update collected_url" do
    put :update, id: @collected_url, collected_url: { url: @collected_url.url }
    assert_redirected_to collected_url_path(assigns(:collected_url))
  end

  test "should destroy collected_url" do
    assert_difference('CollectedUrl.count', -1) do
      delete :destroy, id: @collected_url
    end

    assert_redirected_to collected_urls_path
  end
end
