class Host < ApplicationRecord
  validates :domain, :user_id, :prot, :monitor_status, presence: true

  before_save :prepare_domain

  belongs_to :user
  has_many :statuses, dependent: :destroy

  def prepare_domain
    self.domain = "http://" + domain if domain !~ /^http/
  end

  def last_check_string
    last_check || "N/A"
  end
end
