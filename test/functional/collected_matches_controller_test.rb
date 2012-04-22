require 'test_helper'

class CollectedMatchesControllerTest < ActionController::TestCase
  setup do
    @collected_match = collected_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collected_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collected_match" do
    assert_difference('CollectedMatch.count') do
      post :create, collected_match: { is_match: @collected_match.is_match }
    end

    assert_redirected_to collected_match_path(assigns(:collected_match))
  end

  test "should show collected_match" do
    get :show, id: @collected_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collected_match
    assert_response :success
  end

  test "should update collected_match" do
    put :update, id: @collected_match, collected_match: { is_match: @collected_match.is_match }
    assert_redirected_to collected_match_path(assigns(:collected_match))
  end

  test "should destroy collected_match" do
    assert_difference('CollectedMatch.count', -1) do
      delete :destroy, id: @collected_match
    end

    assert_redirected_to collected_matches_path
  end
end
