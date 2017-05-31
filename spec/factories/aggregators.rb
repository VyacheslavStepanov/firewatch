FactoryGirl.define do
  factory :aggregator do
    aggregator_id 1
    aggregator_status 1
    aggregator_name "MyString"
    db_connection "MyString"
    message_queue_connection "MyString"
  end
end
