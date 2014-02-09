class PlaylistsController < ApplicationController
  respond_to :json

  def index
    playlists = current_user.playlists

    respond_with(playlists) do |format|
      format.json { render :json => playlists.as_json }
    end
  end
end
