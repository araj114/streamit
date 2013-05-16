class TracksController < ApplicationController
  def show
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.create(params[:track])

    respond_to do |format|
      format.js
    end

    Resque.enqueue(MusicPlayer, @track.id)
  end

  def add_to_playlist
    @playlist = Playlist.find(params[:playlist_id])
    @track = Track.find(params[:id])

    @playlist.tracks << @track
  end
end
