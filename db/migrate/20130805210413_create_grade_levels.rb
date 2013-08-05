class CreateGradeLevels < ActiveRecord::Migration
  def change
    create_table :grade_levels do |t|
      t.integer :grade_level

      t.timestamps
    end
  end
end
