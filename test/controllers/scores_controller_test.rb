require 'test_helper'

class ScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get scores_url, as: :json
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post scores_url, params: { score: { cant_blue_bin: @score.cant_blue_bin, cant_green_bin: @score.cant_green_bin, cant_grey_bin: @score.cant_grey_bin, cant_orange_bin: @score.cant_orange_bin, cant_red_bin: @score.cant_red_bin, cant_yellow_bin: @score.cant_yellow_bin } }, as: :json
    end

    assert_response 201
  end

  test "should show score" do
    get score_url(@score), as: :json
    assert_response :success
  end

  test "should update score" do
    patch score_url(@score), params: { score: { cant_blue_bin: @score.cant_blue_bin, cant_green_bin: @score.cant_green_bin, cant_grey_bin: @score.cant_grey_bin, cant_orange_bin: @score.cant_orange_bin, cant_red_bin: @score.cant_red_bin, cant_yellow_bin: @score.cant_yellow_bin } }, as: :json
    assert_response 200
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete score_url(@score), as: :json
    end

    assert_response 204
  end
end
