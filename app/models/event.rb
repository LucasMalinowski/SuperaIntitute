class Event < ApplicationRecord
  include Publishable
  include Searchable

  has_one_attached :image
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :date, presence: true, future_date: { on: :create }
  validates :location, presence: true, length: { minimum: 2, maximum: 255 }
  validates :created_by_id, presence: true

  validate :image_format

  scope :upcoming, -> { where('date >= ?', Time.current) }
  scope :past, -> { where('date < ?', Time.current) }
  scope :by_date, -> { order(:date) }
  scope :recent, -> { order(created_at: :desc) }

  after_create_commit :schedule_image_processing
  after_create_commit :notify_about_creation

  def upcoming?
    date >= Time.current
  end

  def past?
    !upcoming?
  end

  def formatted_date
    date.strftime('%B %d, %Y at %I:%M %p')
  end

  private

  def image_format
    return unless image.attached?

    service_result = ImageProcessingService.call(image)
    return if service_result.success?

    service_result.errors.each { |error| errors.add(:image, error) }
  end
end