class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name, null: false
      t.integer :use_count, default: 0

      t.timestamps null: false
    end
  end
end
