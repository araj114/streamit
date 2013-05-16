class TracksController < ApplicationController

  require 'taglib'

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])

    TagLib::MPEG::File.open(@track.track.path) do |file|
      tag = file.id3v2_tag

      @track.name = tag.title
      @track.artist = tag.artist
    end

    @track.save

    respond_to do |format|
      format.js
    end

    Resque.enqueue(MusicPlayer, @track.id)
  end

  def add_to_playlist
    @playlist = Playlist.find(params[:playlist_id])
    @track = Track.find(params[:id])

    @playlist.tracks << @track

    redirect_to root_path
  end

  def delete_from_playlist
    @queued_track = QueuedTrack.find(params[:queued_track_id])

    @queued_track.destroy

    redirect_to root_path
  end

end
