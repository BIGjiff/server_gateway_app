class User < ApplicationRecord
  # Devise-Module für Authentifizierung
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  # Rollen für Rechteverwaltung
  enum :role, { user: 0, admin: 1 }, default: :user

  # Beziehungen (später wichtig für Server & Gateways)
  has_many :servers, dependent: :nullify
  has_many :gateways, dependent: :nullify

  # Validierungen
  validates :username, presence: true, uniqueness: true
end
