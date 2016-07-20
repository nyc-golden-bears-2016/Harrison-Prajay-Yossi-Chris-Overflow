class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, index: true
      t.string :comment_body
      t.integer :commentable_id, index: true
      t.string :commentable_type

      t.timestamps
    end
  end
end
