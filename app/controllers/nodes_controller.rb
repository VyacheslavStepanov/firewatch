class NodesController < ApplicationController
  before_action :require_authentication!

  expose(:node)
  expose(:nodes) { Node.all }

  NODE_PERMITTED_PARAMS = %i(
    node_status
    node_name
    ip
    geo_name
    db_connection
    message_queue_connection
    queue_name
  ).freeze

  def index
  end

  def new
  end

  def edit
  end

  def create
    node.save
    respond_with node, location: -> { nodes_path }
  end

  def update
    node.update(node_params)
    respond_with node, location: -> { nodes_path }
  end

  def destroy
    node.destroy
    respond_with node, location: -> { nodes_path }
  end

  private

  def node_params
    params.require(:node).permit(*NODE_PERMITTED_PARAMS)
  end
end
