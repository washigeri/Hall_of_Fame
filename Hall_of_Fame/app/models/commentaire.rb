class Commentaire < ActiveRecord::Base
	validates :id_commentaire, presence: true
	validates :id_post, presence: true
	validates :id_auteur, presence: true
	validates :date, presence: true
	validates :contenu, presence: true
end
