class ChangeServerIdNullableInGateways < ActiveRecord::Migration[7.1]
  def change
    change_column_null :gateways, :server_id, true
  end
end
