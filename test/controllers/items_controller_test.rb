require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @item = items(:item_test)
  end
  
  def test_index
    get items_path
    assert_response :success
    assert_not_nil assigns(:items)
  end


  def test_edit
    get edit_item_path(@item)
    assert_response 200
    assert_includes @response.body, @item.name
    assert @item.date.instance_of?(Date)
  end

  
end
