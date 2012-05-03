class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
