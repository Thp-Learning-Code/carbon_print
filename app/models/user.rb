class User < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :zip_code, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :products, through: :footprints

  after_create :welcome_send

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end

end
