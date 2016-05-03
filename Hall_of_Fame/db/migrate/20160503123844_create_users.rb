class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id_user
      t.string :pseudo
      t.string :password
      t.integer :nb_post
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :avatar
      t.timestamp :date_inscription

      t.timestamps null: false
    end
  end
end
