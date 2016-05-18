class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :up_vote
      t.integer :down_vote
      t.belongs_to :user, index: true
      t.string :image

      t.timestamps null: false
    end
  end
end
