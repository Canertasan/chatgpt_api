require "test_helper"

class ChatGptControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chat_gpt_index_url
    assert_response :success
  end

  test "should get ask" do
    get chat_gpt_ask_url
    assert_response :success
  end
end
