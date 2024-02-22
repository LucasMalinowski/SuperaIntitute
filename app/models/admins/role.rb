class Admins::Role < ApplicationRecord
  has_one_attached :image

  POSSIBLE_BENEFITS = ["Vale Refeição", "Vale Alimentação", "Plano de Saúde", "Vale Transporte", "Seguro de Vida", "Plano Odontológico", "Home Office", "Plano de Previdência", "Day Off", "Plano de Carreira", "Ações da Empresa", "Outros"]

  validates :name, :description, :company,  :location, :salary, :contact, :email, :benefits, :requirements, presence: true
end
