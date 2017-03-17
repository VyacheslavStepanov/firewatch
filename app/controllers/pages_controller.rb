class PagesController < ApplicationController
  def home
  end

  def dashboard
    if signed_in?
      @hosts = Host.where(user_id: current_user.id)
      render "pages/dashboard"
    else
      render "pages/home"
    end
  end

  def debug
  end
end
