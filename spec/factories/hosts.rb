FactoryGirl.define do
  factory :host do
    domain "http://mail.ru"
    user_id 1
    prot "http"
    monitor_status 1
    last_status 1
    last_check "2017-03-16 11:28:05"
  end
end
