class AggregatorsController < ApplicationController
  expose(:aggregator)
  expose(:aggregators) { Aggregator.all }

  AGGREGATOR_PERMITTED_PARAMS = %i(
    aggregator_id
    aggregator_status
    aggregator_name
    db_connection
    message_queue_connection
  ).freeze

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    aggregator.save
    respond_with aggregator
  end

  def update
    aggregator.update(aggregator_params)
    respond_with
  end

  def destroy
    aggregator.destroy
    redirect_to aggregators_url, notice: "Aggregator was successfully destroyed."
  end

  private

  def aggregator_params
    params.require(:aggregator).permit(AGGREGATOR_PERMITTED_PARAMS)
  end
end
