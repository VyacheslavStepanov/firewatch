class PagesController < ApplicationController
  before_action :require_authentication!, except: [:heartbeat]

  expose_decorated(:hosts) { fetch_hosts }

  expose(:node)

  def home
  end

  def dashboard
  end

  def reload_hosts
  end

  def debug
  end

  def heartbeat
    node.heartbeat = Time.current + 3.hours # TODO: use zone
    node.save
    render "pages/heartbeat"
  end

  private

  def fetch_hosts
    current_user.hosts.all.order("name").page(params[:page]).per(10)
  end
end
