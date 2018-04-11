require 'test_helper'

class InstructionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get instructions_index_url
    assert_response :success
  end

  test "should get legacies" do
    get instructions_legacies_url
    assert_response :success
  end

  test "should get memories" do
    get instructions_memories_url
    assert_response :success
  end

  test "should get accounts" do
    get instructions_accounts_url
    assert_response :success
  end

end
