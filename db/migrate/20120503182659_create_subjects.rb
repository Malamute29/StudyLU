class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject_id
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
