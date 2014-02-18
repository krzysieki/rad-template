class PlaylistsController < ApplicationController
  respond_to :json

  def index
    playlists = current_user.customers.first.playlists

    respond_with(playlists) do |format|
      format.json { render :json => playlists.as_json(:include => :customers) }
    end
  end

  def create
    new_playlist = Playlist.new
    new_playlist.name = params[:new_playlist][:name]

    if new_playlist.valid?
      new_playlist.save!
      current_user.customers.first.playlists << new_playlist
    else
      render "public/422", :status => 422
      return
    end
        respond_with(new_playlist) do |format|
          format.json { render :json => new_playlist.as_json }
        end
  end

  # DELETE /playlist/1
  # DELETE /playlist/1.json
  def destroy
    playlists = current_user.customers.first.playlists
    @playlist = playlists.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to :root }
      format.json { head :no_content }
    end
  end
end
