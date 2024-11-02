require "test_helper"

class WorkflowControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get workflow_create_url
    assert_response :success
  end

  test "should get show" do
    get workflow_show_url
    assert_response :success
  end
end
