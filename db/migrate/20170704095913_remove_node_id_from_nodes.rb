class RemoveNodeIdFromNodes < ActiveRecord::Migration[5.0]
  def change
    remove_column :nodes, :node_id, :integer
  end
end
