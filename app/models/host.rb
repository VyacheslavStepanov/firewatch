class Host < ApplicationRecord
  before_validation :prepare_domain, on: %i(create update)

  validates :user_id, :prot, :monitor_status, presence: true

  belongs_to :user
  has_many :statuses, dependent: :destroy
  has_and_belongs_to_many :notifications, join_table: "hosts_notifications"

  def prepare_domain
    self.domain = domain.strip
    self.domain = "http://" + domain if domain !~ /^http/
  end
end
