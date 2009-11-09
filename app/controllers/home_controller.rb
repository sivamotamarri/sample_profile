class HomeController < ApplicationController
  before_filter :authorize
  
  def index
    @page_title = "Welcome to MyProfile"
  end
  
  def profile
    @account  = Account.find_by_id(session[:user_id])
    @user = User.find_by_account_id(@account.id)
     @page_title = "Create Or Edit Your Profile"
    if @user.blank?
      @user = User.new
    end
  end
  
  def create

   @account  = Account.find_by_id(params[:id]) 
   @user = User.find_by_account_id(@account.id)
   
   if @user.blank?
        @user = User.new(params[:user])
         if @user.save
            redirect_to :action => 'show',:id=>@user.account_id
           else
             render :action => 'profile' and return          
          end
    else
      if  @user.update_attributes(params[:user])
         redirect_to :action => 'show',:id=>@user.account_id
         else
            render :action => 'profile' and return   
         end
         
  end
  
  
  end
  
  def show    
    @user = User.find_by_account_id(session[:user_id])
    @page_title = "View Your Profile"
    if @user.blank?
      
      redirect_to :action => 'profile',:id=> params[:id]
      end
  end
  
  def email_to_frd
    
    FriendEmail::deliver_to_friend(params[:recipient], params[:subject],params[:body],params[:perm])
    
    redirect_to :controller => 'home' ,:action => "show", :id => params[:id]
  end
  
end
