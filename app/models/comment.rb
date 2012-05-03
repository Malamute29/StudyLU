class Comment < ActiveRecord::Base
  attr_accessible :comment_id, :content, :post_id, :rating, :user_id
end
