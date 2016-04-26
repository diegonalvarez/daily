require 'hipchat'

class Daily
  def send(app_key, text)
    client = HipChat::Client.new(app_key, :api_version => 'v2')
    client[@room].send(@notification_name, text, :color => 'purple', :message_format => 'text', :notify => true)
  end
end
