require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song_name = self.new_by_name(song_name)
    song_name.save
    song_name
  end

  def Song.find_by_name(song_name)
    @@all.find {|song_instance| song_instance.name == song_name}
  end

  def Song.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name) == nil
       Song.create_by_name(song_name)
    else
       Song.find_by_name(song_name)
    end
  end

  def Song.alphabetical
    song_names_array = @@all.sort_by! {|song| song.name.downcase }
  end

  def self.new_from_filename(song)
    delimiters = [' - ', "."]
    split_word = song.split(Regexp.union(delimiters))
    song = self.new
    song.name = split_word[1]
    song.artist_name = split_word[0]
    song
  end

  def self.create_from_filename(song)
      self.all << self.new_from_filename(song)
  end     

  def Song.destroy_all
    self.all.clear
  end

end
