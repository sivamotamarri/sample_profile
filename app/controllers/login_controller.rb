class LoginController < ApplicationController
  
  before_filter :authorize , :except =>['index','signin','signup']
  
  def index
    @page_title = "Welcome to MyProfile"
    if !session[:user_id].blank?
     redirect_to :controller => 'home',:action => 'show', :id => session[:user_id]
     end
    @account = Account.new
    @account_data = User.find_by_myname(params[:id])    
  end
  
  
  def signup
     @page_title = "Enter Signup deatils for Your Account"
    if request.post?      
     @account = Account.new(params[:account])
     if @account.save
            
     flash[:notice_wel]   = "Your Account was successfully created. You may Sign in Now"
     redirect_to :action => "index"
     else
       render :action => 'signup'
       end
   end
 end
 
 def signin
   if request.post?  
    @account = Account.authenticate(params[:username], params[:password]) 

    if !@account.blank?
     session[:user_id] = @account.id
     redirect_to :controller => 'home'#,:action => 'show', :id => @account.id
     else
       flash[:notice] ="Invalid Login Details"
        redirect_to :action => 'index'
      end 

else
   redirect_to :action => 'index'
  end
 end
 
 def logout
  session[:user_id] = nil
 redirect_to :controller => 'login' 
  end


end
