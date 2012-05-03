class User < ActiveRecord::Base
  attr_accessible :email, :f_name, :is_admin, :l_name, :user_id, :username

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

 
end
