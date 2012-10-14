require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get swimmers" do
    get :swimmers
    assert_response :success
  end

end
