class CreateTrueFalseQuestions < ActiveRecord::Migration
  def change
    create_table :true_false_questions do |t|
      t.string :content
      t.integer :exam_id

      t.timestamps
    end
  end
end
