require 'open-uri'

class Post < ActiveRecord::Base
  include PublicActivity::Model
  tracked only: [:create, :flykke], owner: Proc.new{ |controller, model| model.user }
  # include Shared::Callbacks
  acts_as_votable


  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :attachment, AvatarUploader
  default_scope -> { order('created_at DESC') }

  CATEGORIES = %w(All Charity Music News Photos Videos)

  validates :category, inclusion: { in: CATEGORIES }
  validates_presence_of :user
  validates_presence_of :url

end





  # counter_culture :user






  # auto_html_for :content do
  #   html_escape
  #   image
  #   youtube(width: 400, height: 250, autoplay: true)
  #   link target: '_blank', rel: 'nofollow'
  #   simple_format
  # end
