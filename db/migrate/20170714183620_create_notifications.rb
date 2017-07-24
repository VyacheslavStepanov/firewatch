class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.belongs_to :notification_type, foreign_key: true
      t.string :parameter_1
      t.string :parameter_2
      t.string :parameter_3
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
