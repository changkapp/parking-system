require 'test_helper'

class Backoffice::MensalistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
