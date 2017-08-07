class NotificationsController < ApplicationController
  before_action :require_authentication!
  before_action :require_correct_user, only: %i(show edit update destroy)

  expose(:notification)
  expose(:notifications) { current_user.notifications.all }

  PERMITTED_NOTIFICATION_PARAMS = %i(
    name
    notification_type_id
    parameter_1
    parameter_2
    parameter_3
    user_id
  ).freeze

  def index
  end

  def new
    gon.types = NotificationType.all
    notification.notification_type_id = 1
    notification.parameter_1 = current_user.email
  end

  def edit
    gon.types = NotificationType.all
  end

  def create
    notification.user = current_user
    notification.save
    respond_with notification, location: -> { notifications_path }
  end

  def update
    notification.update(notification_params)
    respond_with notification, location: -> { notifications_path }
  end

  def destroy
    notification.destroy
    respond_with notification, location: -> { notifications_path }
  end

  private

  def notification_params
    params.require(:notification).permit(*PERMITTED_NOTIFICATION_PARAMS)
  end

  def require_correct_user
    redirect_to notifications_path unless notification and notification.user_id == current_user.id
  end
end
