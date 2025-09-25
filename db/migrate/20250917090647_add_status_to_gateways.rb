class AddStatusToGateways < ActiveRecord::Migration[8.0]
  def change
    add_column :gateways, :status, :string
  end
end
