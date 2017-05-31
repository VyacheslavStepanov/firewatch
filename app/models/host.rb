class Host < ApplicationRecord
  validates :domain, :user_id, :prot, :monitor_status, presence: true
  before_save :prepare_values

  def prepare_values
    # self.last_node = 0
    # self.monitor_status = 1

    self.domain = "http://" + domain if domain !~ /^http/
  end

  def last_check_string
    last_check ? last_check : "N/A"
  end
end
