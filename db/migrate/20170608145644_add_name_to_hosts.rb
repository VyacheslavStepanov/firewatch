class AddNameToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :name, :string
  end
end
