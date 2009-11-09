class FriendEmail < ActionMailer::Base
  
  def to_friend(to,subject,body,name)
    
    
    @recipients = to
    @from = "myprofile.com"
    @subject = subject  
   
    @body["body"] = body
    @body["username"] = name
    

 end

end
