class Track < ActiveRecord::Base
  attr_accessible :name, :track
  mount_uploader :track, TrackUploader

  has_many :queued_tracks
  has_many :playlists, through: :queued_tracks

  def name
    name = self[:name]

    if name.nil?
      'Unknown Track'
    else
      name
    end

  end

end
