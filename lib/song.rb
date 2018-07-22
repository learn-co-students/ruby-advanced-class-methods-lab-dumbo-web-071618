#require 'pry'

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
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    Song.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if !song
      song = self.create_by_name(name)
    end
    song
  end

  def Song.alphabetical
    self.all.sort_by!{ |song| song.name }
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_title = data[1].split(".")[0]
    song = Song.new
    song.name = song_title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song_with_artist = Song.new_from_filename(filename)
    song_with_artist.save
    song_with_artist
  end

  def self.destroy_all
    self.all.clear
  end
end

=begin
song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song.name #=> "Blank Space"
song.artist_name #=> "Taylor Swift"
=end
