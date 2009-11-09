require 'test/test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_invalid_with_empty_attributes
    user = User.new
    assert !user.valid?
    assert user.errors.invalid?(:full_name)
    assert user.errors.invalid?(:address)  
  end 
  
  def test_valid_full_name
  user = User.new
  assert !user.save
  assert_equal "can't be blank" , user.errors.on(:full_name)
 end
  def test_valid_address
    user = User.new
    assert !user.save
    assert_equal "can't be blank" , user.errors.on(:address)
  end
end
