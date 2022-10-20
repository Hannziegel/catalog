require './app'
require_relative './music_album/music_album_module'

class Main
  include MusicAlbumModule

  def initialize
    @app = App.new
  end

  def menu
    puts "\n"
    puts 'Please choose an option by entering a number:
    1  - List all books
    2  - List all music albums
    3  - List of games
    4  - List all genres
    5  - List all labels
    6  - List all authors
    7  - Add a book
    8  - Add a music album
    9  - Add a game
    10 - Exit'
  end

  def handle_menu_selection
    user_input = gets.chomp
    case user_input
    when '1'
      p 'not impimented'
    when '2'
      @app.list_all_albums
    when '3'
      p 'not impimented'
    when '4'
      @app.list_all_genres
    when '5'
      p 'not impimented'
    when '6'
      p 'not impimented'
    when '7'
      p 'not impimented'
    when '8'
      add_new_album_details
    when '9'
      p 'not impimented'
    when '10'
      @app.preserve_files
      puts 'Exiting the application...'
      sleep 2
      exit
    else
      puts "\nERROR: Invalid option. Please select a digit from (1-10)\n"
    end
  end

  def run
    user_input = nil

    puts 'Welcome to the catalog of my things'

    while user_input != '10'
      menu
      handle_menu_selection
    end
  end
end

Main.new.run
