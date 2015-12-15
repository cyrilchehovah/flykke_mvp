class Follow < ActiveRecord::Base
  # include Shared::Callbacks

  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| model.follower }

  # NOTE: Follows belong to the "followable" interface, and also to followers
  belongs_to :followable, :polymorphic => true
  belongs_to :follower,   :polymorphic => true

  def block!
    self.update_attribute(:blocked, true)
  end


  validates_presence_of :follower
  validates_presence_of :followable
end




