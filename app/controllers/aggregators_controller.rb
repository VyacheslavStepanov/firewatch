class AggregatorsController < ApplicationController
  before_action :set_aggregator, only: %i(show edit update destroy)

  AGGREGATOR_PERMITTED_PARAMS = %i(
    aggregator_id
    aggregator_status
    aggregator_name
    db_connection
    message_queue_connection
  ).freeze

  # GET /aggregators
  def index
    @aggregators = Aggregator.all
  end

  # GET /aggregators/1
  def show
  end

  # GET /aggregators/new
  def new
    @aggregator = Aggregator.new
  end

  # GET /aggregators/1/edit
  def edit
  end

  # POST /aggregators
  def create
    @aggregator = Aggregator.new(aggregator_params)

    if @aggregator.save
      redirect_to @aggregator, notice: "Aggregator was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /aggregators/1
  def update
    if @aggregator.update(aggregator_params)
      redirect_to @aggregator, notice: "Aggregator was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /aggregators/1
  def destroy
    @aggregator.destroy
    redirect_to aggregators_url, notice: "Aggregator was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_aggregator
    @aggregator = Aggregator.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def aggregator_params
    params.require(:aggregator).permit(AGGREGATOR_PERMITTED_PARAMS)
  end
end
