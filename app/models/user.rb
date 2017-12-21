class User < ApplicationRecord
  before_validation :normalize_params, on: [:create, :update]

  has_many :conversations, :foreign_key => :sender_id, class_name: 'Conversation'
  has_many :conversations, :foreign_key => :recipient_id, class_name: 'Conversation'

  has_many :messages, through: :conversations

  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates :username, :presence => true
  validates :username, :uniqueness => true

  validates_confirmation_of :password

  scope :all_users_except, -> (current_user) {
    where.not(id: current_user)
  }

  scope :all_available_crew, -> {
    where(:account_type => 'Crew', :available => 'Available')
  }

  scope :all_available_captains, -> {
    where(:account_type => 'Captain', :available => 'Available')
  }

  scope :search, -> (search_parameter) {
    where("lower(home) like lower(?) OR lower(name) like lower(?) OR lower(username) like lower(?) OR lower(detail) like lower(?)", "%#{search_parameter}%", "%#{search_parameter}%", "%#{search_parameter}%", "%#{search_parameter}%")
  }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def normalize_params
    self.name = name.downcase.titleize if attribute_present? 'name'
    self.email = email.downcase if attribute_present? 'email'
    self.home = home.downcase.titleize if attribute_present? 'home'
  end
end
