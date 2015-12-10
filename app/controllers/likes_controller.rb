class LikesController < ApplicationController
  # before_action :find_likeable
  before_action :authenticate_user!
  respond_to :js

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user

    respond_to do |format|
      format.html { redirect_to root_path(@post)}
      format.js
    end
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  def flykke
    @post = Post.find(params[:id])
    @post.liked_by current_user, :vote => 'flykke', :vote_scope => 'flykke'
    # @post.create_activity(:flykke, owner: current_user)
    redirect_to :back
  end

  # def create
  #   @likeable.liked_by current_user
  #   @likeable.create_activity(:like, owner: current_user)
  # end

  # def destroy
  #   @likeable.disliked_by current_user
  #   activity = PublicActivity::Activity.find_by_trackable_id_and_key(@likeable.id, "#{@likeable_type.downcase}.like")
  #   activity.destroy if activity.present?
  # end

  # private
  # def find_likeable
  #   @likeable_type = params[:likeable_type].classify
  #   @likeable = @likeable_type.constantize.find(params[:likeable_id])
  # end
end
