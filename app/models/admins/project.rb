class Admins::Project < ApplicationRecord
  has_one_attached :image

  validates :name, :description,  :location, :contact, presence: true

  scope :upcoming, -> { where("date >= ?", Date.today) }

  def upcoming?
    date >= Date.today
  end
end
