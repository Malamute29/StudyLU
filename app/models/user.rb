class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :f_name, :is_admin, :l_name, :user_id, :username, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i



	validates :email, :presence => true,
                          :format => { :with => email_regex },
                          :uniqueness => {:case_sensitive => false};
        validates :f_name, :presence =>true,
                           :length => {:maximum => 50}
        validates :is_admin, :presence => true
        validates :l_name, :presence => true
        validates :user_id, :presence => true,
                            :uniqueness =>true
        validates :username, :presence => true,
                             :uniqueness => true
        validates :password, :presence => true,
                             :confirmation => true,
                             :length => { :within => 6..40 }
                             
    before_save :encrypt_password
    
    def has_password?(submitted_password)
    end
    
        
    private
    def encrypt_password
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      string # Only a temp implementation
    end
 
end
