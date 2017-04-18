class AddLastnodeToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :lastnode, :integer
  end
end
