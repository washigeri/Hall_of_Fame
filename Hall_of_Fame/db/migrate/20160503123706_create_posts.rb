class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id_post
      t.integer :id_auteur
      t.integer :up_vote
      t.integer :down_vote
      t.timestamp :date
      t.string :image
      t.string :contenu
      t.string :titre

      t.timestamps null: false
    end
  end
end
