require 'open-uri'

class Post < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  mount_uploader :attachment, AvatarUploader


  CATEGORIES = %w(All Charity Music News Photos Videos)

  validates :category, inclusion: { in: CATEGORIES }
end
