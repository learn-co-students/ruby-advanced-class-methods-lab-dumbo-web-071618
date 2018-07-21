class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all[-1]
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = Song.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.create_by_name(name)
    Song.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(str)
    artist, name = str.split(" - ")
    new_song = Song.new
    new_song.name = name[0..name.length - 5]
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(str)
    @@all << Song.new_from_filename(str)
  end

  def self.destroy_all
    @@all = []
  end

end
