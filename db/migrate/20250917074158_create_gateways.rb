class CreateGateways < ActiveRecord::Migration[8.0]
  def change
    create_table :gateways do |t|
      t.string :serial
      t.references :server, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gateways, :serial, unique: true
  end
end
