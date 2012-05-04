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
      encrypted_password == encrypt(submitted_password)
    end
    
    def self.authenticate(email, submitted_password)
      user = find_by_email(email)   # I think this means we need to use email to login
      return nil if user.nil?
      return user if user.has_password?(submitted_password)
    end
        
    private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
 
end
