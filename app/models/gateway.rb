class Gateway < ApplicationRecord
  belongs_to :server, optional: true
  validates :serial, presence: true, uniqueness: true
end
