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

  def debug
  end
end
