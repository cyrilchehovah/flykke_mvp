class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :body, length: { minimum: 1 }
end
