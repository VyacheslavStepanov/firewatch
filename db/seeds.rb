Node.create(node_status: 1, node_name: "node001", ip: "192.168.0.3", geo_name: "Russia, Innopolis",queue_name: "CHECK_QUEUE1")
Node.create(node_status: 1, node_name: "node002", ip: "192.168.0.4", geo_name: "USA, New York",queue_name: "CHECK_QUEUE2")
Node.create(node_status: 1, node_name: "node003", ip: "192.168.0.5", geo_name: "Europe, Amsterdam",queue_name: "CHECK_QUEUE3")

user = User.new(
  id: 10,
  full_name: "Ivan Ivanov",
  email: 'fs@firewatch.tech',
  password: '123456789',
  password_confirmation: '123456789',
  admin: true
)
user.skip_confirmation!
user.save!

Host.create(name: "mail.ru", domain: "http://mail.ru", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)
Host.create(name: "innopolis.ru", domain: "http://innopolis.ru", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)
Host.create(name: "flatstack", domain: "http://flatstack.com", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)

# def random_responce
#   Faker::Number.between(20,60)*10
# end

# 59.times.each do |i|
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,00), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,10), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,20), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,30), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,40), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
#   Status.create(host_id: 1, status: 200,created_at: DateTime.new(2017,6,17,12,i,50), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )

#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,00), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://innopolis.ru" )
#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,10), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://innopolis.ru" )
#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,20), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://innopolis.ru" )
#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,30), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://innopolis.ru" )
#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,40), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://innopolis.ru" )
#   Status.create(host_id: 2, status: 200,created_at: DateTime.new(2017,6,17,12,i,50), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://innopolis.ru" )

#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,00), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://flatstack.ru" )
#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,10), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://flatstack.ru" )
#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,20), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://flatstack.ru" )
#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,30), response_time: random_responce, node_name: "node003", node_id: 3, error_description: "", url: "http://flatstack.ru" )
#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,40), response_time: random_responce, node_name: "node001", node_id: 1, error_description: "", url: "http://flatstack.ru" )
#   Status.create(host_id: 3, status: 200,created_at: DateTime.new(2017,6,17,12,i,50), response_time: random_responce, node_name: "node002", node_id: 2, error_description: "", url: "http://flatstack.ru" )
# end
