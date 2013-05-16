class QueuedTrack < ActiveRecord::Base
  belongs_to :track
  belongs_to :playlist
  attr_accessible :started_playing
end
