class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  enum role: { user: 0, admin: 1 }, _default: :user

  scope :admins, -> { where(role: :admin) }
  scope :regular_users, -> { where(role: :user) }

  before_save :normalize_email

  def display_name
    name.presence || email.split('@').first
  end

  def admin?
    role == 'admin'
  end

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end
