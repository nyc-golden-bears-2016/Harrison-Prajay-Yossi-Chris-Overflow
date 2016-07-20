class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_body
      t.integer :user_id, index: true
      t.integer :question_id, index: true
      t.boolean :best_answer, default: false

      t.timestamps
    end
  end
end
