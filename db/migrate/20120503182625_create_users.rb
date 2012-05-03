class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :user_id
      t.string :f_name
      t.string :l_name
      t.string :email
      t.integer :is_admin

      t.timestamps
    end
  end
end
