class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :course_id
      t.string :title
      t.string :desc
      t.string :file_loc
      t.float :raiting

      t.timestamps
    end
  end
end
