class NodeHearbeatController < ApplicationController
  expose(:node)

  def update
    node.heartbeat = Time.current + 3.hours # TODO: use zone
    node.save
    render "node_heartbeat/update"
  end
end
