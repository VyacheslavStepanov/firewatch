class PagesController < ApplicationController
  expose_decorated(:hosts) { current_user.hosts.all.order("name DESC") }
  expose(:node)
  def home
  end

  def dashboard
  end

  def reload_hosts
  end

  def heartbeat
    node.heartbeat = Time.current + 3.hours # TODO: use zone
    node.save
    render "pages/heartbeat"
  end

  def debug
  end
end
