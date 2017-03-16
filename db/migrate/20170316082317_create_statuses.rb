class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :host_id
      t.datetime :dt
      t.integer :status
      t.integer :latency

      t.timestamps
    end
  end
end
