class HostDecorator < Draper::Decorator
  delegate_all

  def status_icon
    paused? ? "fi-play" : "fi-pause"
  end

  def action_url
    "hosts/#{id}#{paused? ? '/play' : '/stop'}"
  end

  def paused?
    monitor_status == 1 ? false : true
  end

  def last_location
    node = Node.find(last_node) unless last_node == 0
    node ? node.geo_name : "N/A"
  end

  def last_check_string
    last_check || "N/A"
  end
end
