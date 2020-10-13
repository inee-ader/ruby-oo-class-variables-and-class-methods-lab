require 'pry'

class Song

    @@artists = []
    @@count = 0
    @@genres = []
    @@all = []

    # CLASS METHODS #
    def self.all
        @@all
    end
    
    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end
    
    def self.genres
        @@genres.uniq
    end

    def self.genre_count #all_genres = {}
        self.all.each_with_object(Hash.new(0)) do |song, all_genres| 
            all_genres[song.genre] += 1
        end
    end

    def self.artist_count
        self.all.each_with_object(Hash.new(0)) do |song, hash| 
            hash[song.artist] += 1
        end
    end

    attr_reader :name, :artist, :genre
    
    # INSTANCE METHODS #
    
    def initialize(name, artist, genre)
        @name, @artist, @genre = name, artist, genre
        self.save
    end
    
    def save
        @@artists << self.artist
        @@genres << self.genre
        @@count += 1
        @@all << self
    end
    

end