class Role < ApplicationRecord
  has_one_attached :image
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id'

  POSSIBLE_BENEFITS = [
    'Vale Refeição',
    'Vale Alimentação',
    'Plano de Saúde',
    'Vale Transporte',
    'Seguro de Vida',
    'Plano Odontológico',
    'Home Office',
    'Plano de Previdência',
    'Day Off',
    'Plano de Carreira',
    'Ações da Empresa',
    'Outros'
  ].freeze

  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
  validates :company, presence: true, length: { minimum: 2, maximum: 255 }
  validates :location, presence: true, length: { minimum: 2, maximum: 255 }
  validates :salary, presence: true, length: { minimum: 2, maximum: 100 }
  validates :contact, presence: true, length: { minimum: 2, maximum: 255 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :requirements, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :created_by_id, presence: true

  validate :benefits_are_valid
  validate :image_format

  scope :published, -> { where(published: true) }
  scope :by_company, ->(company) { where(company: company) }
  scope :by_location, ->(location) { where('location ILIKE ?', "%#{location}%") }
  scope :recent, -> { order(created_at: :desc) }

  def formatted_salary
    return salary if salary.start_with?('R$')

    "R$ #{salary}"
  end

  def benefits_list
    benefits.join(', ')
  end

  private

  def benefits_are_valid
    return if benefits.blank?

    invalid_benefits = benefits - POSSIBLE_BENEFITS
    return if invalid_benefits.empty?

    errors.add(:benefits, "contains invalid benefits: #{invalid_benefits.join(', ')}")
  end

  def image_format
    return unless image.attached?

    acceptable_types = ['image/jpeg', 'image/png', 'image/gif', 'image/webp']
    return if image.content_type.in?(acceptable_types)

    errors.add(:image, 'must be a JPEG, PNG, GIF, or WebP')
  end
end
