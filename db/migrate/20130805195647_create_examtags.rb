class CreateExamtags < ActiveRecord::Migration
  def change
    create_table :examtags do |t|
      t.integer :exam_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
