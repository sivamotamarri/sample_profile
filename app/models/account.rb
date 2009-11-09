class Account < ActiveRecord::Base

  
  validates_presence_of :user_name,:password,:password_confirmation
   # validates_confirmation_of :confirm_password , :on => :create
  validates_uniqueness_of   :user_name, :on => :create
	attr_accessor :password_confirmation
	validates_confirmation_of :password
     
        def self.authenticate(username, password)
              user =Account.find_by_user_name(username)
              if user
              expected_password = encrypted_password(password, user.password_salt)
              if user.password_hash != expected_password
              user = nil
           end
       end
       user
    end

    def password
        @password
    end


    def password=(pwd)
        @password = pwd
        return if pwd.blank?
        create_new_salt
        self.password_hash = Account.encrypted_password(self.password, self.password_salt)
      end
      
    private

    def self.encrypted_password(password, password_salt)
        string_to_hash = password + "profile" + password_salt 
        Digest::SHA1.hexdigest(string_to_hash)
    end

    def create_new_salt
        self.password_salt = self.object_id.to_s + rand.to_s
    end

end
