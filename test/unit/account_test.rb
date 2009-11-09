require 'test/test_helper'

class AccountTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :accounts
def test_invalid_with_empty_attributes
  account = Account.new
  assert !account.valid?
  assert account.errors.invalid?(:user_name)
  assert account.errors.invalid?(:password)
  assert account.errors.invalid?(:password_confirmation)
end 


def test_invalid_values
  account = Account.new(:user_name => "siva krishna" ,
    :password => "krishna" ,
    :password_confirmation => "zzz" )
     assert !account.valid?
   end
   
def test_valid_values
    account = Account.new(:user_name => "siva krishna" ,
    :password => "krishna" ,
    :password_confirmation => "krishna" )
   
    assert account.valid?
  end
  
def test_unique_user_name
  account = Account.new(:user_name => accounts(:account).user_name)
  assert !account.save
  assert_equal "has already been taken" , account.errors.on(:user_name)
end
  
  

end
