class HostMonitoringsController < ApplicationController
  before_action :require_authentication!

  expose_decorated(:host)

  def update
    if host.monitor_status == 1
      host.monitor_status = 0
      host.last_status = nil
    else
      host.monitor_status = 1
    end
    host.save
    redirect_to root_url
  end
end
