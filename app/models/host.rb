class Host < ApplicationRecord
  validates :domain, :user_id, :prot, :mstatus, presence: true
end
