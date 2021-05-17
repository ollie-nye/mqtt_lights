class ManualsController < ApplicationController
  def index; end

  def create
    Esp32.publish(Zone.new(**zone_params))
  end

  def random
    first, last = [rand(525), rand(525)].sort
    Esp32.publish(
      Zone.new(
        first: first,
        last: last,
        brightness: rand(255),
        red: rand(255),
        green: rand(255),
        blue: rand(255)
      )
    )
  end

  def hurt
    (0..525).each do |pixel|
      Esp32.publish(
        Zone.new(
          first: pixel,
          last: pixel,
          brightness: rand(255),
          red: rand(255),
          green: rand(255),
          blue: rand(255)
        )
      )
    end
  end

  private

  def zone_params
    params.require(:zone).permit(:first, :last, :brightness, :red, :green, :blue)
  end
end
