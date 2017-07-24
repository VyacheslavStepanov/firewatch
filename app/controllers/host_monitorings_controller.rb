class HostMonitoringsController < ApplicationController
  before_action :require_authentication!

  expose_decorated(:host)

  def update
    host.monitor_status = host.monitor_status == 1 ? 0 : 1
    host.save
    redirect_to root_url
  end
end
