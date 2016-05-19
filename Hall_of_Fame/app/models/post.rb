class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  mount_uploader :image, ImageUploader
  acts_as_votable
  acts_as_commentable
  validates_presence_of :title
  validates_presence_of :content

end
