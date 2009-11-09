# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
def authorize
  @user = Account.find_by_id(session[:user_id]) 
  if @user.blank?
  flash[:error] = "Please log in"
  redirect_to :controller => 'login'  
  end
end
end
