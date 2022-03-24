class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    self.songs.average(:length).to_f
  end

end
