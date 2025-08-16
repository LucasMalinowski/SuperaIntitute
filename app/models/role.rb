# frozen_string_literal: true

class Role < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_rich_text :description
  has_one_attached :image

  BENEFITS = [
    'Vale Refeição', 'Vale Alimentação', 'Plano de Saúde', 'Vale Transporte',
    'Seguro de Vida', 'Plano Odontológico', 'Home Office', 'Plano de Previdência',
    'Day Off', 'Plano de Carreira', 'Ações da Empresa', 'Outros'
  ].freeze

  validates :name, :description, :company, :location, :salary, :contact, :email, :requirements, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :benefits, inclusion: { in: BENEFITS }, allow_blank: true
end