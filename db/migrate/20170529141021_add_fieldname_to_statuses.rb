class AddFieldnameToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :error_description, :string
    add_column :statuses, :url, :string
  end
end
