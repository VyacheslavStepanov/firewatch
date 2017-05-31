FactoryGirl.define do
  factory :node do
    node_id 1
    node_status 1
    node_name "MyString"
    ip "MyString"
    geo_name "MyString"
    db_connection "MyString"
    message_queue_connection "MyString"
    queue_name "MyString"
  end
end
