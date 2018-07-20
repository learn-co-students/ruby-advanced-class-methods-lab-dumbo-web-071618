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
		song = self.new
		song.save 
		song
	end

	def self.new_by_name name 
		song = self.new 
		song.name = name 
		song
	end

	def self.create_by_name name 
		song = self.create 
		song.name = name 
		song
	end

	def self.find_by_name name 
		self.all.find do |song|
			song.name == name
		end
	end

	def self.find_or_create_by_name name
		if self.find_by_name(name) != nil
			song = self.find_by_name name
		else 
			song = self.create_by_name name	
		end
		song
	end

	def self.alphabetical
		self.all.sort_by do |song|
			song.name
		end
	end

	def self.new_from_filename file_name

		song_break = file_name.slice(0,file_name.index('.')).split(' - ')
		song = self.new_by_name song_break[1]
		song.artist_name = song_break[0]
		song
	end

	def self.create_from_filename file_name

		song = Song.new_from_filename file_name
		song.save 
		song
	end

	def self.destroy_all 
		@@all = []
	end

end

file = "Chance The Rapper - No Problem.mp3"
song = Song.new_from_filename(file)
