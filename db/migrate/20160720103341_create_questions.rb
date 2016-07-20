class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, index: true
      t.string :title
      t.string :question_body
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
