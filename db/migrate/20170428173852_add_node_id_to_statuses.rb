class AddNodeIdToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :node_id, :integer
  end
end
