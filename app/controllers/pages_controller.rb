class PagesController < ApplicationController
  def home
    @tracks = Track.all
  end
end
