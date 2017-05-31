class AddResponseTimeToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :response_time, :integer
  end
end
