class AddHeartbeatToNodes < ActiveRecord::Migration[5.0]
  def change
    add_column :nodes, :heartbeat, :datetime
  end
end
