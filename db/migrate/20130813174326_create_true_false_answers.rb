class CreateTrueFalseAnswers < ActiveRecord::Migration
  def change
    create_table :true_false_answers do |t|
      t.string :content
      t.integer :true_false_question_id

      t.timestamps
    end
  end
end
