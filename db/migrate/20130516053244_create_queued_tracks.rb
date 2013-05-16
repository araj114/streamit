class CreateQueuedTracks < ActiveRecord::Migration
  def change
    create_table :queued_tracks do |t|
      t.datetime :started_playing
      t.references :track
      t.references :playlist

      t.timestamps
    end
    add_index :queued_tracks, :track_id
    add_index :queued_tracks, :playlist_id
  end
end
