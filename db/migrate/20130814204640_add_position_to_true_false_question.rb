class AddPositionToTrueFalseQuestion < ActiveRecord::Migration
  def change
    add_column :true_false_questions, :position, :integer
  end
end
