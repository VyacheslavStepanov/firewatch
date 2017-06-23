class StatusDecorator < Draper::Decorator
  delegate_all

  def error
    return error_description unless /^[0-9][0-9][0-9]$/ === error_description
    I18n.t("http.error_" + error_description)
  end

  def status_string
    if status.status != 200
      then "Down"
    else
      "Up"
    end
  end

  def style
    if status.status != 200
      then "color:#FF0000"
    else
      "color:#008000"
    end
  end

  def node_location
    node = Node.find_by(node_id: node_id)
    node.present? ? node.geo_name : "N/A"
  end

  def node_ip
    node = Node.find_by(node_id: node_id)
    node.present? ? node.ip : "N/A"
  end

  def tooltip
    "Node id: #{node_id}, node ip address: #{node_ip}"
  end
end
