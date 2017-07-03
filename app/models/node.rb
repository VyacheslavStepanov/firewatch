class Node < ApplicationRecord
  self.primary_key = "node_id"

  has_many :statuses
end
