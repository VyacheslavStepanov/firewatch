class AddNodeNameToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :node_name, :string
  end
end
