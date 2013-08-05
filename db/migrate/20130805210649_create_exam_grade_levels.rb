class CreateExamGradeLevels < ActiveRecord::Migration
  def change
    create_table :exam_grade_levels do |t|
      t.integer :exam_id
      t.integer :grade_level_id

      t.timestamps
    end
  end
end
