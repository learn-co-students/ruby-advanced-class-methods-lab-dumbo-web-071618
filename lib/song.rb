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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(title)
    song = Song.create
    song.name= title
    return song
  end

  def self.create_by_name(title)
    song = Song.create
    song.name= title
    return song
  end

  def self.find_by_name(song_name)
    Song.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(title)
  Song.find_by_name(title) == nil ? Song.create_by_name(title) : Song.find_by_name(title)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    filename[1]= filename[1][0..-5]
    song = Song.create_by_name(filename[1])
    song.artist_name = filename[0]
    return song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    filename[1]= filename[1][0..-5]
    song = Song.create_by_name(filename[1])
    song.artist_name = filename[0]
    return song
  end

  def self.destroy_all
    @@all = []
  end

end
