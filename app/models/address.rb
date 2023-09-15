class Address < ApplicationRecord
  validates :cep, :street, :neighborhood, :city, :uf, presence: true
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/, message: "Precisa ser um CEP valido" }
  validates :uf, format: { with: /\A[A-Z]{2}\z/, message: "Precisa ser um UF valido" }
  validates :ibge_code, numericality: { only_integer: true }, allow_blank: true

  belongs_to :municipe
end
