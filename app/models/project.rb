# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :description
  has_one_attached :image

  validates :name, :description, :location, :contact, presence: true

  scope :upcoming, -> { where('starts_at >= ?', Date.today).order(:starts_at) }
  scope :past,     -> { where('starts_at < ?', Date.today).order(starts_at: :desc) }
end