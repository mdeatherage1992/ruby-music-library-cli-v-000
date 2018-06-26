require 'pry'
class MusicLibraryController
attr_reader :path

def initialize(path = './db/mp3s')
  @path = path
  new_object = MusicImporter.new(path)
  imported_object = new_object.import
end

def call
  message = ''
  while message != "exit"
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  message = gets.strip
end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      new_list = artist.songs.sort {|a,z| a.name <=> z.name}
      new_list.each.with_index(1) do |song,i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of an artist:"
      input = gets.strip

      if genre = Genre.find_by_name(input)
        new_list = genre.songs.sort {|a,z| a.name <=> z.name}
        new_list.each.with_index(1) do |genre,i|
          puts "#{i}. #{genre.artist.name} - #{genre.name}"
        end
      end
    end




def list_songs
  new_list = Song.all.sort{|a,z| a.name <=> z.name}
  new_list.each.with_index(1) do |song,i|
    puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artists
  new_list = Artist.all.sort{|a,z| a.name <=> z.name}
   new_list.each.with_index(1) do |artist,i|
     puts "#{i}. #{artist.name}"
  end
end

def list_genres
  new_list = Genre.all.sort{|a,z| a.name <=> z.name}
  new_list.each.with_index(1) do |genre,i|
    puts "#{i}. #{genre.name}"
end
end



end
