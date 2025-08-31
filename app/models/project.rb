class Project < ApplicationRecord
  has_one_attached :image
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :location, presence: true, length: { minimum: 2, maximum: 255 }
  validates :contact, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :created_by_id, presence: true

  validate :date_cannot_be_in_the_past, on: :create, if: :date?
  validate :image_format

  scope :upcoming, -> { where('date >= ? OR date IS NULL', Date.current) }
  scope :past, -> { where('date < ?', Date.current) }
  scope :published, -> { where(published: true) }
  scope :by_date, -> { order(Arel.sql('date IS NULL, date ASC')) }

  def upcoming?
    date.nil? || date >= Date.current
  end

  def past?
    date.present? && date < Date.current
  end

  def formatted_date
    return 'Ongoing' if date.nil?

    date.strftime('%B %d, %Y')
  end

  private

  def date_cannot_be_in_the_past
    return unless date.present? && date < Date.current

    errors.add(:date, "can't be in the past")
  end

  def image_format
    return unless image.attached?

    acceptable_types = ['image/jpeg', 'image/png', 'image/gif', 'image/webp']
    return if image.content_type.in?(acceptable_types)

    errors.add(:image, 'must be a JPEG, PNG, GIF, or WebP')
  end
end