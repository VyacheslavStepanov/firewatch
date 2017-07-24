class Host < ApplicationRecord
  validates :domain, :user_id, :prot, :monitor_status, presence: true

  before_save :prepare_domain

  belongs_to :user
  has_many :statuses, dependent: :destroy
  has_and_belongs_to_many :notifications, join_table: "hosts_notifications"

  def prepare_domain
    self.domain = "http://" + domain if domain !~ /^http/
  end
end
