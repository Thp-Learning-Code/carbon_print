class User < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :footprints
  has_many :products, through: :footprints
  geocoded_by :address
  after_validation :geocode


  def address
    [town,country].compact.join(', ')
  end

  def self.from_facebook(auth)

    where(facebook_id: auth.uid).first_or_create do |user|
      # retreive the uid in database or create a new id
      user.email = auth.info.email
      # prefilled this informations which recovered from the facebook method
      # user.last_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
      # don't ask confirmation because it's Facebook.
    end
  end

end
