class Host < ApplicationRecord
  validates :domain, :user_id, :prot, :mstatus, presence: true
  before_save :prepare_values

  def prepare_values
    self.lastnode = 0
    self.mstatus = 1
    self.domain = "http://" + domain if domain !~ /^http/
  end

  def last_check_string
    last_check ? last_check : "N/A"
  end
end
