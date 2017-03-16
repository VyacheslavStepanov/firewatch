class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :domain, limit: 255
      t.integer :user_id
      t.string :prot, limit: 255
      t.integer :mstatus
      t.integer :last_status
      t.datetime :last_check

      t.timestamps
    end
  end
end
