class User < ActiveRecord::Base
  acts_as_voter
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  validates_presence_of :avatar
  validates_integrity_of :avatar
  validates_processing_of :avatar
  validates_presence_of :nickname
  private
    def avatar_size_validation
        errors[:avatar] << "Should be less than 500kb" if avatar.size > 0.5.megabytes
    end

  end
