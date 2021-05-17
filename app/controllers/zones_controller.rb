class ZonesController < ApplicationController
  before_action :set_zone, only: %i[ show edit update destroy ]

  def index
    @zones = Zone.all
  end

  def show
  end

  def update
    @zone.update(zone_params)

    redirect_to @zone
  end

  private

  def set_zone
    @zone = Zone.find(params[:id])
  end

  def zone_params
    params.require(:zone).permit(:brightness, :red, :green, :blue)
  end
end
