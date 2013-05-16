class Playlist < ActiveRecord::Base
  attr_accessible :name

  has_many :queued_tracks
  has_many :tracks, through: :queued_tracks
end
