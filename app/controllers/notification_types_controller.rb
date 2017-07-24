class NotificationTypesController < ApplicationController
  before_action :require_authentication!

  expose(:notification_type)
  expose(:notification_types) { NotificationType.all }

  PERMITTED_NOTIFICATION_PARAMS = %i(
    name
    parameter_1_name
    parameter_2_name
    parameter_3_name
  ).freeze

  def index
  end

  def new
  end

  def edit
  end

  def create
    notification_type.save
    respond_with notification_type, location: -> { notification_types_path }
  end

  def update
    notification_type.update(notification_type_params)
    respond_with notification_type, location: -> { notification_types_path }
  end

  def destroy
    notification_type.destroy
    respond_with notification_type, location: -> { notification_types_path }
  end

  private

  def notification_type_params
    params.require(:notification_type).permit(*PERMITTED_NOTIFICATION_PARAMS)
  end
end
