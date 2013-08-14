class AddPositionToEssayQuestion < ActiveRecord::Migration
  def change
    add_column :essay_questions, :position, :integer
  end
end
