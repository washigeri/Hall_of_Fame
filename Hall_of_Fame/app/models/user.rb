class User < ActiveRecord::Base
	validates: id_user, presence: true
	validates: pseudo, presence: true
	validates: password, presence: true
	validates: nb_posts, presence: true
	validates: nom, presence: true
	validates: prenom, presence: true
	validates: email, presence: true
	validates: date_inscription, presence: true
end
