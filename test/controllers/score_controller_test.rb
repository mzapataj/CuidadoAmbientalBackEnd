require 'test_helper'

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get score_index_url
    assert_response :success
  end

  test "should get show" do
    get score_show_url
    assert_response :success
  end

end
