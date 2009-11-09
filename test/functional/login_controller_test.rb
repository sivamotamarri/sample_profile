require 'test/test_helper'

class LoginControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  fixtures :accounts
  def setup 
    @account = accounts(:account) 
  end 
  def test_welcome_with_out_session 
    get :index
   assert_response :success    
 end
 
 def test_signin_success_with_post
  post(:signin ,{:username =>'siva', :password => 'krishna'})
  
  assert_redirected_to :controller => 'home'
  assert_equal accounts(:account).id , session[:user_id]
  
end
def test_welcome_with_session 
     get(:index , nil , {:user_id => 1}) 
    assert_redirected_to :controller => 'home',:action => 'show', :id => session[:user_id]   
 end
def test_signin_with_get
  get :signin   
  assert_redirected_to :action => 'index'  
end
 def test_logout_success
  get :logout
   assert_redirected_to :action => 'index' 
 end

 def test_signup_success
 post(:signup , {:account => {:user_name =>'krishna',:password => 'krishna',:password_confirmation => 'krishna'}})
 assert_template  ''
 end
 
def test_signup_for_uniqueness_name
 post(:signup , {:account => {:user_name =>'siva',:password => 'krishna',:password_confirmation => 'krishna'}})
 assert_template  'signup'
 end

def test_signup_for_password_confirmation
 post(:signup , {:account => {:user_name =>'krishna',:password => 'krishna',:password_confirmation => 'kri9shna'}})
 assert_template  'signup'
 end
 
end
