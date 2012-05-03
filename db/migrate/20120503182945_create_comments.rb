class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :comment_id
      t.integer :post_id
      t.integer :user_id
      t.text :content
      t.float :rating

      t.timestamps
    end
  end
end
