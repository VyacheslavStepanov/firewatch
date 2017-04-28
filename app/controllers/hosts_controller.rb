class HostsController < ApplicationController
  before_action :set_host, only: %i(show edit update destroy play stop)
  before_action :require_correct_user, only: %i(show edit update destroy play stop)

  # GET /hosts
  def statuses
    @host = Host.find(params[:id])
    @statuses = Status.where(host_id: @host.id).order("id desc").limit(100)
    redirect_to root_url and return if @host.domain.empty?
  end

  # GET /hosts
  def index
    @hosts = Host.all
    redirect_to root_url
  end

  # GET /hosts/play
  def play
    @host.monitor_status = 1
    @host.save
    redirect_to root_url
  end

  # GET /hosts/stop
  def stop
    @host.monitor_status = 0
    @host.save
    redirect_to root_url
  end

  # GET /hosts/1
  def show
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)
    redirect_to root_url and return if @host.domain.empty?
    @host.user_id = current_user.id unless @host.user_id
    redirect_to root_url and return if @host.save
    render :new
  end

  # PATCH/PUT /hosts/1
  def update
    if @host.update(host_params)
      redirect_to @host, notice: "Host was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /hosts/1
  def destroy
    @host.destroy
    redirect_to hosts_url, notice: "Host was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_host
    @host = Host.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def host_params
    params.require(:host).permit(:domain, :user_id, :prot, :monitor_status, :last_status, :last_check)
  end

  def require_correct_user
    redirect_to hosts_url if !user_signed_in? or !@host or @host.user_id != current_user.id
  end
end
