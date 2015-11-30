require 'open-uri'

class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AvatarUploader
end
