require 'test_helper'

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_template 'index'
  end

end
