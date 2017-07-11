class AggregatorsController < ApplicationController
  expose(:aggregator)
  expose(:aggregators) { Aggregator.all }

  AGGREGATOR_PERMITTED_PARAMS = %i(
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
    respond_with aggregator, location: -> { aggregators_path }
  end

  def update
    aggregator.update(aggregator_params)
    respond_with aggregator, location: -> { aggregators_path }
  end

  def destroy
    aggregator.destroy
    respond_with aggregator, location: -> { aggregators_path }
  end

  private

  def aggregator_params
    params.require(:aggregator).permit(AGGREGATOR_PERMITTED_PARAMS)
  end
end
