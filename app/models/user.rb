class User < ApplicationRecord
  before_validation :normalize_params, on: [:create, :update]

  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates :username, :presence => true
  validates :username, :uniqueness => true

  validates_confirmation_of :password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def normalize_params
    self.name = name.downcase.titleize
    self.email = email.downcase
    self.home = home.downcase.titleize
  end
end
