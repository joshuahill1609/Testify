class CreateEssayQuestions < ActiveRecord::Migration
  def change
    create_table :essay_questions do |t|
      t.string :content
      t.integer :exam_id

      t.timestamps
    end
  end
end
