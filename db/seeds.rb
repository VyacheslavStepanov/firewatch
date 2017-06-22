Node.create(node_id: 1, node_status: 1, node_name: "node001", ip: "192.168.0.3", geo_name: "Russia, Innopolis",queue_name: "CHECK_QUEUE1")
Node.create(node_id: 2, node_status: 1, node_name: "node002", ip: "192.168.0.4", geo_name: "USA, New York",queue_name: "CHECK_QUEUE2")
Node.create(node_id: 3, node_status: 1, node_name: "node003", ip: "192.168.0.5", geo_name: "Europe, Amsterdam",queue_name: "CHECK_QUEUE3")

user = User.new(
  id: 10,
  full_name: "Ivan Ivanov",
  email: 'fs@firewatch.tech',
  password: '123456789',
  password_confirmation: '123456789'
)
user.skip_confirmation!
user.save!

Host.create(id: 10, name: "mail.ru", domain: "http://mail.ru", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)
Host.create(id: 11, name: "innopolis.ru", domain: "http://innopolis.ru", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)
Host.create(id: 12, name: "flatstack", domain: "http://flatstack.com", user_id: 10, prot: "http", monitor_status: 1, last_status: 1, last_node: 1)

Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,19,10), response_time: 1000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru")
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,19,20), response_time: 100000, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,19,30), response_time: 10000, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,19,40), response_time: 100000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,19,50), response_time: 100000, node_name: "QUERY", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,00), response_time: 50000, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,10), response_time: 90000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,20), response_time: 40000, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,30), response_time: 10000, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,40), response_time: 20000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,20,50), response_time: 100000, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,00), response_time: 50000, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,10), response_time: 80000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,20), response_time: 70000, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,30), response_time: 100000, node_name: "node003", node_id: 3, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,40), response_time: 60000, node_name: "node001", node_id: 1, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,21,50), response_time: 40000, node_name: "node002", node_id: 2, error_description: "", url: "http://mail.ru" )
Status.create(host_id: 10, status: 1,created_at: DateTime.new(2017,6,17,22,00), response_time: 100000, node_name: "QUEUE", node_id: 3, error_description: "", url: "http://mail.ru" )

Status.create(host_id: 11, status: 0, created_at: DateTime.new(2017,6,17,21,00),response_time: 100000, node_name: "node002", node_id: 2, error_description: "502", url: "http://innopolis.ru" )
Status.create(host_id: 11, status: 0, created_at: DateTime.new(2017,6,17,21,10),response_time: 100000, node_name: "node002", node_id: 2, error_description: "502", url: "http://innopolis.ru" )

Status.create(host_id: 12, status: 1, created_at: DateTime.new(2017,6,17,21,00),response_time: 100000, node_name: "node001", node_id: 1, error_description: "", url: "http://flatstack.ru" )
Status.create(host_id: 12, status: 0, created_at: DateTime.new(2017,6,17,21,10),response_time: 100000, node_name: "node002", node_id: 2, error_description: "502", url: "http://flatstack.ru" )
