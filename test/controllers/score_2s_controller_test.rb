require 'test_helper'

class Score2sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score_2 = score_2s(:one)
  end

  test "should get index" do
    get score_2s_url, as: :json
    assert_response :success
  end

  test "should create score_2" do
    assert_difference('Score2.count') do
      post score_2s_url, params: { score_2: { gotas: @score_2.gotas, user_id: @score_2.user_id, value: @score_2.value } }, as: :json
    end

    assert_response 201
  end

  test "should show score_2" do
    get score_2_url(@score_2), as: :json
    assert_response :success
  end

  test "should update score_2" do
    patch score_2_url(@score_2), params: { score_2: { gotas: @score_2.gotas, user_id: @score_2.user_id, value: @score_2.value } }, as: :json
    assert_response 200
  end

  test "should destroy score_2" do
    assert_difference('Score2.count', -1) do
      delete score_2_url(@score_2), as: :json
    end

    assert_response 204
  end
end
