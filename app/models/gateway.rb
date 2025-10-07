class Gateway < ApplicationRecord
  belongs_to :server, optional: true
  validates :serial, presence: true, uniqueness: true

  # Filter (Scopes)
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :assigned, -> { where.not(server_id: nil) }
  scope :unassigned, -> { where(server_id: nil) }
end
