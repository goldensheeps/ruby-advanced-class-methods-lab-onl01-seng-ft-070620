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
    song = @@all.find { |song| song.name == name }
    song
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(name)
    split = name.split(' - ')
    artist_name = split[0]
    song_name = split[1].gsub(".mp3", "")
    song = Song.new
    
  end
  
  def self.create_from_filename(name)
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end
