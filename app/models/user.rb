# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Role management. Add a `role` integer column (default: 0) with values defined here.
  enum role: { user: 0, editor: 1, admin: 2 }

  # Validations for additional user attributes
  validates :name, presence: true

  # Associate with posts or other models here
end