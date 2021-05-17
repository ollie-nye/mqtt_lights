require 'esp32'

class Zone < ApplicationRecord
  after_update :publish_changes

  def publish_changes
    Esp32.publish(self)
  end
end
