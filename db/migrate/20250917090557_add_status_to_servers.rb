class AddStatusToServers < ActiveRecord::Migration[8.0]
  def change
    add_column :servers, :status, :string
  end
end
