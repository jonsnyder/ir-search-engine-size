require 'test_helper'

class CollectQueriesControllerTest < ActionController::TestCase
  setup do
    @collect_query = collect_queries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collect_queries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collect_query" do
    assert_difference('CollectQuery.count') do
      post :create, collect_query: { query: @collect_query.query }
    end

    assert_redirected_to collect_query_path(assigns(:collect_query))
  end

  test "should show collect_query" do
    get :show, id: @collect_query
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collect_query
    assert_response :success
  end

  test "should update collect_query" do
    put :update, id: @collect_query, collect_query: { query: @collect_query.query }
    assert_redirected_to collect_query_path(assigns(:collect_query))
  end

  test "should destroy collect_query" do
    assert_difference('CollectQuery.count', -1) do
      delete :destroy, id: @collect_query
    end

    assert_redirected_to collect_queries_path
  end
end
