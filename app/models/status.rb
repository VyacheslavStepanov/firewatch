class Status < ApplicationRecord
  belongs_to :host
  belongs_to :node, primary_key: "node_id"
end
