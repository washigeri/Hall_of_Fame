class Post < ActiveRecord::Base
	validates :id_post, presence: true
	validates :id_auteur, presence: true
	validates :up_vote, presence: true
	validates :down_vote, presence: true
	validates :date, presence: true
	validates :contenu, presence: true
	validates :titre, presence: true
end
