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
    container = Song.new
    container.save
    container
  end

  def self.new_by_name(name)
    container = Song.new
    container.name = name
    container
  end

  def self.create_by_name(name)
    container = Song.new
    container.save
    container.name = name
    container
  end

  def self.find_by_name(name)
    @@all.find do |song_obj|
      song_obj.name == name
    end
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found
      found
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song_obj| song_obj.name}
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")
    parsed_name[1] = File.basename(parsed_name[1],File.extname(parsed_name[1]))
    new_song = self.new_by_name(parsed_name[1])
    new_song.artist_name = parsed_name[0]
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all.clear
  end
end
