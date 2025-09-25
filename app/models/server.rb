class Server < ApplicationRecord
  has_many :gateways, dependent: :nullify
  validates :name, presence: true
end
