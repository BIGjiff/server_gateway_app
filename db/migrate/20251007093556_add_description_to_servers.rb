class AddDescriptionToServers < ActiveRecord::Migration[8.0]
  def change
    add_column :servers, :description, :string
  end
end
