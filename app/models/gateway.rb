class Gateway < ApplicationRecord
  belongs_to :server, optional: true

  validates :serial, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :assigned, -> { where.not(server_id: nil) }
  scope :unassigned, -> { where(server_id: nil) }

  # ✅ Die Validierung MUSS innerhalb der Klasse stehen:
  validate :active_gateways_must_have_server

  private

  # Prüft, dass Gateways nur aktiv sein dürfen, wenn sie einem Server zugewiesen sind.
  def active_gateways_must_have_server
    if active? && server_id.nil?
      errors.add(:server_id, "muss gesetzt sein, wenn das Gateway aktiv ist")
    end
  end
end
