class AddAgentnameToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :agentname, :string
  end
end
