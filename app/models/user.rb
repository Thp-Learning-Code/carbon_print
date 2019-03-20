class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }

  validates :zip_code, presence: true, length: { is: 5 }
  validates :email,
   presence: true,
   uniqueness: true,
   format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :password, length: { in: 6..20 }
  validates :town, presence: true
  validates :country, presence: true



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :footprints
  has_many :products, through: :footprints
  geocoded_by :address
  after_validation :geocode

  def address
    [town,country].compact.join(', ')
  end

end
