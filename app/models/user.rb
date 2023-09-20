class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]
  # registered: created an account but have not updated their empty profile
  # acvtive: updated profile with info
  # dummy: fake account for testing and presentation
  # away: user not active, hide buddy ups in market place
  enum :status, { registered: 0, active: 1, dummy: 2, away: 3 }, default: :registered
  has_one :profile
  has_many :social_links, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.github_name = auth.info.nickname
      user.avatar_url = auth.info.image
      user.profile = Profile.new
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
