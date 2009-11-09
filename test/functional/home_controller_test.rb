require 'test/test_helper'

class HomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  fixtures :accounts
  def setup
    session[:user_id] = accounts(:account).id # assume we are in login
 end

  def test_profile_with_out_login
   get(:profile , {:id=> 1})
   assert_response :success 
  
 end
 
  def test_profile
    setup
    get(:profile , {:id=> 1})
    assert_response :success 
  end
  
  def test_create
    setup
    post(:create, {:id=> session[:user_id],:user => {:id => 2,
   :full_name =>"Krishna",
   :address => "Kallam",
   :city => "Kakinada",
   :province => "Kaka Street",
   :country => "India",
   :postal_code => "533345",
   :account_id => 2}})
    
    assert_redirected_to :action => 'show',:id=> 2
    
  end
  def test_email_to_frd
    
  post(:email_to_frd, {:recipient => "sivakrishna_nyros@yahoo.com",:subject => "Welcome to my Profile",:body => "Check my Profile Friend",
  :perm => "sivakrishna"})
  assert_redirected_to :controller => 'home' ,:action => "show", :id => 1
  
  end
  
  def test_show
     setup
     get(:show,{:id=>session[:user_id]})
     assert_response :success 
  end
  
end
