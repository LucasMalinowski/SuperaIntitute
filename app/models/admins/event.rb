class Admins::Event < ApplicationRecord
  has_one_attached :image

  validates :name,:description,:date, :location, presence: true

  scope :upcoming, -> { where("date >= ?", Date.today) }

  def upcoming?
    date >= Date.today
  end
end
