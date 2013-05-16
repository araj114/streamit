class Track < ActiveRecord::Base
  attr_accessible :name, :track
  mount_uploader :track, TrackUploader

  def name
    name = self[:name]

    if name.nil?
      'Unknown Track'
    else
      name
    end

  end

end
