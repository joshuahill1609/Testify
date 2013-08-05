class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :exam_name
      t.string :exam_subject
      t.integer :user_id

      t.timestamps
    end
  end
end
