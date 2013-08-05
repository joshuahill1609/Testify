class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :exam_id
      t.string :tag_title

      t.timestamps
    end
  end
end
