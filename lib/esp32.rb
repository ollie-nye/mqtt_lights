require 'mqtt'
require 'json'

class Esp32
  def self.publish(zone)
    if zone.first > zone.last
      client.publish("living_room/esp32/zone", zone.attributes.merge('last': 525).to_json)
      client.publish("living_room/esp32/zone", zone.attributes.merge('first': 0).to_json)
    else
      client.publish("living_room/esp32/zone", zone.to_json)
    end
  end

  def self.client
    @client ||= MQTT::Client.connect('mqtt://mqtt.services.local')
  end
end
