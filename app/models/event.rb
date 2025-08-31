class Event < ApplicationRecord
  include Searchable

  has_many_attached :images
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :location, presence: true, length: { minimum: 2, maximum: 255 }
  validates :created_by_id, presence: true

  scope :upcoming, -> { where('date >= ?', Time.current) }
  scope :past, -> { where('date < ?', Time.current) }
  scope :by_date, -> { order(:date) }
  scope :recent, -> { order(created_at: :desc) }
  scope :published, -> { where(published: true) }

  def upcoming?
    date >= Time.current
  end

  def past?
    !upcoming?
  end

  def formatted_date
    I18n.l(date, format: :long)
  end
end