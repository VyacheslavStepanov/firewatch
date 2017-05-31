class RemoveAgentnameFromStatuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :agentname, :string
  end
end
