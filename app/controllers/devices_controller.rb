class DevicesController < ApplicationController
  respond_to :json

  def index
    devices = current_user.devices

    respond_with(devices) do |format|
      format.json { render :json => devices.as_json }
    end
  end
end
