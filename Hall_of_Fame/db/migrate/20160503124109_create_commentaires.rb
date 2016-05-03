class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.integer :id_commentaire
      t.integer :id_post
      t.integer :id_auteur
      t.timestamp :date
      t.string :contenu

      t.timestamps null: false
    end
  end
end
