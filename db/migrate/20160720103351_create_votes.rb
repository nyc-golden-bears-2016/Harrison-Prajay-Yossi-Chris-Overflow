class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id, index: true
      t.string :votable_type
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
