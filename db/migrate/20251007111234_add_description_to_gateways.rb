class AddDescriptionToGateways < ActiveRecord::Migration[8.0]
  def change
    add_column :gateways, :description, :string
  end
end
