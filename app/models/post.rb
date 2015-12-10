require 'open-uri'

class Post < ActiveRecord::Base
  acts_as_votable
  mount_uploader :attachment, AvatarUploader

  belongs_to :user
  has_many :comments, dependent: :destroy


  CATEGORIES = %w(All Charity Music News Photos Videos)

  validates :category, inclusion: { in: CATEGORIES }
end
