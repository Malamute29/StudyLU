class Post < ActiveRecord::Base
  attr_accessible :course_id, :desc, :file_loc, :post_id, :raiting, :title
end
