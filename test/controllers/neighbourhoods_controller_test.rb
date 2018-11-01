require 'test_helper'

class NeighbourhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @neighbourhood = neighbourhoods(:one)
  end

  test "should get index" do
    get neighbourhoods_url, as: :json
    assert_response :success
  end

  test "should create neighbourhood" do
    assert_difference('Neighbourhood.count') do
      post neighbourhoods_url, params: { neighbourhood: { home_price: @neighbourhood.home_price, name: @neighbourhood.name, num_businesses: @neighbourhood.num_businesses } }, as: :json
    end

    assert_response 201
  end

  test "should show neighbourhood" do
    get neighbourhood_url(@neighbourhood), as: :json
    assert_response :success
  end

  test "should update neighbourhood" do
    patch neighbourhood_url(@neighbourhood), params: { neighbourhood: { home_price: @neighbourhood.home_price, name: @neighbourhood.name, num_businesses: @neighbourhood.num_businesses } }, as: :json
    assert_response 200
  end

  test "should destroy neighbourhood" do
    assert_difference('Neighbourhood.count', -1) do
      delete neighbourhood_url(@neighbourhood), as: :json
    end

    assert_response 204
  end
end
