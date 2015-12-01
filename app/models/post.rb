require 'open-uri'

class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AvatarUploader

  CATEGORIES = %w(All Charity Music News Photos Videos)

  validates :category, inclusion: { in: CATEGORIES }
end
