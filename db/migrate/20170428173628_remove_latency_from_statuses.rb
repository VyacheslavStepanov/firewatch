class RemoveLatencyFromStatuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :latency, :integer
  end
end
