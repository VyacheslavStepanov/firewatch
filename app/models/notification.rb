class Notification < ApplicationRecord
  belongs_to :notification_type
  belongs_to :user
  has_and_belongs_to_many :hosts

  validates :name, presence: true

  def label_1
    notification_type ? notification_type.parameter_1_name : ""
  end

  def label_2
    notification_type ? notification_type.parameter_2_name : ""
  end

  def label_3
    notification_type ? notification_type.parameter_3_name : ""
  end

  def parameter_1_display
    display = notification_type && !notification_type.parameter_1_name.empty? ? "" : "none"
    { style: "display: #{display}" }
  end

  def parameter_2_display
    display = notification_type && !notification_type.parameter_2_name.empty? ? "" : "none"
    { style: "display: #{display}" }
  end

  def parameter_3_display
    display = notification_type && !notification_type.parameter_3_name.empty? ? "" : "none"
    { style: "display: #{display}" }
  end
end
