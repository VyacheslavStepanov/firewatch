class HostsController < ApplicationController
  before_action :require_authentication!

  expose_decorated(:host)
  expose_decorated(:hosts) { current_user.hosts.all }
  expose_decorated(:statuses) { fetch_statuses }

  def status_history
  end

  def reload_history
  end

  def index
    redirect_to root_url
  end

  def show
  end

  def path
  end

  def edit
  end

  def create
    update_params(host)
    host.save
    respond_with host, location: -> { root_path }
  end

  def update
    host.update(host_params)
    respond_with host, location: -> { root_path }
  end

  def destroy
    host.destroy
    respond_with host
  end

  private

  def update_params(host)
    host.name = host.domain
    host.last_node = 0
    host.monitor_status = 1
    host.user_id ||= current_user.id
  end

  def host_params
    params.require(:host).permit(:name, :domain, :user_id, :prot, :monitor_status, :last_status, :last_check, notification_ids: [])
  end

  def fetch_statuses
    host.statuses.all.order("created_at desc").page(params[:page]).per(100)
  end
end
