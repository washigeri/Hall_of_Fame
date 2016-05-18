class Post < ActiveRecord::Base
  before_save :init_post
  belongs_to :user
  mount_uploader :image, ImageUploader
  acts_as_votable
  validates_presence_of :title
  validates_presence_of :content
  #validates_numericality_of :down_vote
  #validates_numericality_of :up_vote

  def init_post
    self.up_vote = 0
    self.down_vote = 0
  end

end
