class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

has_many :posts
has_many :comments

mount_uploader :avatar, AvatarUploader
mount_uploader :cover, AvatarUploader

validates_presence_of :first_name, :last_name, :email, :password


  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

    def number_of_flykkes_received
      array = self.posts.map { |post| [ post.get_likes(:vote_scope => 'flykke').size ] }
      a = array.inject{|sum,x| sum + x }
      return a.inject{|sum,x| sum + x }
    end
end


  # acts_as_voter

  # self.per_page = 10

  # extend FriendlyId
  # friendly_id :name, use: [:slugged, :finders]
