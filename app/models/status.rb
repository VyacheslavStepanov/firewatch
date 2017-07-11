class Status < ApplicationRecord
  belongs_to :host
  belongs_to :node
end
