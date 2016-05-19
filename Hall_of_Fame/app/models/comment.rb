class Comment < ActiveRecord::Base
	attr_accessible :content

	belongs_to :post

	validates :content, :presence => true
	validates :user_id, :presence => true
	validates :post_id, :presence => true

	default_scope :order => 'comments.created_at DESC'
end
