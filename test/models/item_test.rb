require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  def setup
    @item = Item.new(
      name: 'new item',
      date: '2018-02-25')
  end
  
  test "table column exist" do
    assert Item.column_names.include?('name')
    assert Item.column_names.include?('date')
    assert Item.column_names.include?('done')
  end
  
  test 'valid item is saved' do
    assert @item.valid?
  end

  test 'ensure name is required' do
    @item.name = nil
    refute @item.valid?
    assert_not_nil @item.errors[:name], 'no validation error for name'
  end
  
  test 'ensure date is not required' do
    @item.date = nil
    assert @item.valid?
    assert @item.save
    @item = Item.find @item.id
  end
  
  test 'ensure done is false at default' do
    assert_equal false, @item.done
  end


end
