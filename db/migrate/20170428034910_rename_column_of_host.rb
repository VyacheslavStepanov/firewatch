class RenameColumnOfHost < ActiveRecord::Migration[5.0]
  def change
    rename_column :hosts, :mstatus, :monitor_status
    rename_column :hosts, :lastnode, :last_node
  end
end
