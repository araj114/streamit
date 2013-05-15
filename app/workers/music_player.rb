class MusicPlayer

  @queue = :tracks

  def self.perform(track_id)
    @track = Track.find(track_id)
    exec 'mpg123', '-q', @track.track.path
    puts 'this is a test'
  end
end
