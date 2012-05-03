class User < ActiveRecord::Base
  attr_accessible :email, :f_name, :is_admin, :l_name, :user_id, :username
end
