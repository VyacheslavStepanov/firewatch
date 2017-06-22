class PagesController < ApplicationController
  def home
  end

  def dashboard
    if signed_in?
      @hosts = Host.where(user_id: current_user.id).order("id DESC")
      render "pages/dashboard"
    else
      render "pages/home"
    end
  end

  def reload_hosts
    @hosts = Host.where(user_id: current_user.id).order("id DESC")
    respond_to do |format|
      format.js
    end
  end

  def heartbeat
    @node = Node.find(params[:id])
    @node.heartbeat = Time.current + 3.hours # TODO: use zone
    @node.save
    render "pages/heartbeat"
  end

  def debug
  end
end
