class MusicPlayer

  @queue = :tracks

  def self.perform(track_id)
    exec 'mpg123', '-q', '/Users/indineromac2/Music/test.mp3'
    puts 'this is a test'
  end
end
