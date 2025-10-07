class AddActiveToGateways < ActiveRecord::Migration[7.1]
  def change
    add_column :gateways, :active, :boolean, default: false
  end
end
