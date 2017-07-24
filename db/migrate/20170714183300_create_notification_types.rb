class CreateNotificationTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_types do |t|
      t.string :name
      t.string :parameter_1_name
      t.string :parameter_2_name
      t.string :parameter_3_name

      t.timestamps
    end
  end
end
