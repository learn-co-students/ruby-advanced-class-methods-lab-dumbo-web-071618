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

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = Song.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new_by_name(title)
    @@all << song
    song
  end

  def self.find_by_name(title)
    @@all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename.split(" - ").each do |item|
      if item.include?(".mp3")
        @name = item.chomp(".mp3")
      else @artist_name = item
      end
    end
    new_song = self.create_by_name(@name)
    new_song.artist_name = @artist_name
    new_song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end



end
