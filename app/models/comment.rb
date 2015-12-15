class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| model.user }

  belongs_to :user
  belongs_to :post
  belongs_to :commentable, :polymorphic => true, :counter_cache => true

  default_scope -> { order('created_at DESC') }

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  validates :body, length: { minimum: 1 }
  validates_presence_of :user
end




 # auto_html_for :comment do
 #    html_escape
 #    image
 #    youtube(width: 400, height: 250, autoplay: true)
 #    link target: '_blank', rel: 'nofollow'
 #    simple_format
 #  end
