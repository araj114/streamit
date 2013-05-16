class PagesController < ApplicationController
  def home
    @tracks = Track.all
    @playlist = Playlist.where(name: 'default').first_or_create
  end
end
