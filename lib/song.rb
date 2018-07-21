class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initalize(name)
    @name = name
    @artist_name = artist_name
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   song = self.new
   song.save 
   return song
    
  end 

  def self.new_by_name(value)

     song = self.new 
     song.name = value 
     return song
     

  end 

  def self.create_by_name(value)
    song = self.new 
     song.name = value 
      song.save
      return song
  end


    def self.find_by_name(value)
        @@all.find {|ele| ele.name == value}
    end 

    def self.find_or_create_by_name(value)
     self.find_by_name(value) ? self.find_by_name(value) : self.create_by_name(value)
    end


    def self.alphabetical
     a = @@all.sort_by {|k,v| k.name}

     return a
      
    end


    def self.new_from_filename(value)
      #
      
      song_name =  value.split("-").pop.strip.gsub(/(\..+)/, "")
      a_name = value.split("-")
      @artist_name = a_name[0].strip

      song = self.new
      song.name = song_name
      song.artist_name = @artist_name
     
      return song

    end

    def self.create_from_filename(value)

      song_name =  value.split("-").pop.strip.gsub(/(\..+)/, "")
      a_name = value.split("-")
      @artist_name = a_name[0].strip

      song = self.new
      song.name = song_name
      song.artist_name = @artist_name
      song.save 
     
      return song


    end 
      
      def self.destroy_all
       @@all = []
       @@all
      end 

    

end