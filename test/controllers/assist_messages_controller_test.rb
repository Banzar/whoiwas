require 'test_helper'

class AssistMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assist_message = assist_messages(:one)
  end

  test "should get index" do
    get assist_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_assist_message_url
    assert_response :success
  end

  test "should create assist_message" do
    assert_difference('AssistMessage.count') do
      post assist_messages_url, params: { assist_message: { completed: @assist_message.completed, content: @assist_message.content, email: @assist_message.email, subject: @assist_message.subject } }
    end

    assert_redirected_to assist_message_url(AssistMessage.last)
  end

  test "should show assist_message" do
    get assist_message_url(@assist_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_assist_message_url(@assist_message)
    assert_response :success
  end

  test "should update assist_message" do
    patch assist_message_url(@assist_message), params: { assist_message: { completed: @assist_message.completed, content: @assist_message.content, email: @assist_message.email, subject: @assist_message.subject } }
    assert_redirected_to assist_message_url(@assist_message)
  end

  test "should destroy assist_message" do
    assert_difference('AssistMessage.count', -1) do
      delete assist_message_url(@assist_message)
    end

    assert_redirected_to assist_messages_url
  end
end
