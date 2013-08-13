class CreateAnswerOrders < ActiveRecord::Migration
  def change
    create_table :answer_orders do |t|
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
