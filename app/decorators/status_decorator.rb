class StatusDecorator < ApplicationDecorator
  delegate :status, :error_description, :created_at, :node, :url, :response_time, :node_id

  def error
    return "" if status == 200
    return error_description unless error_description == ""
    I18n.t("http.error_#{status.status}")
  end

  def status_string
    if status != 200
      "Down"
    else
      "Up"
    end
  end

  def time
    created_at.strftime("%H:%M:%S")
  end

  def style
    status != 200 ? "color:#FF0000; text-align: center;" : "color:#008000; text-align: center;"
  end

  def node_location
    node.present? ? node.geo_name : "N/A"
  end

  def node_ip
    node.present? ? node.ip : "N/A"
  end

  def tooltip
    "Node id: #{node_id}, node ip address: #{node_ip}"
  end
end
