require 'pry'

class Song
    @@all = []
    attr_accessor :artist, :name
    def initialize(name)
        @name = name
        self.save
    end
   
    def self.all
        @@all
    end

    def save
        @@all << self
    end
    
    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
    end

    def self.new_by_filename(filename)
        artist = filename.split(" - ")[0]
        song = filename.split(" - ")[1]
        new_song = self.new(song)
        new_song.artist_name=(artist)
        new_song
    end
end