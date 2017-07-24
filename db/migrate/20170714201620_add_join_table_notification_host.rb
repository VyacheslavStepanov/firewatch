class AddJoinTableNotificationHost < ActiveRecord::Migration[5.0]
  def change
    create_join_table :hosts, :notifications  do |t|
      t.index [:notification_id, :host_id], name: "index_notifications_hosts_on_notification_id_and_host_id"
      t.index [:host_id, :notification_id], name: "index_hosts_notifications_on_host_id_and_notification_id"
    end
  end
end
