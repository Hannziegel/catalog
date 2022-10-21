require_relative './music_album/music_album'
require_relative './music_album/genre'
require_relative './music_album/preserver_module'
require_relative './book/label'
require_relative './book/book'
require_relative './game/game'
require_relative './game/author'

class App
  include PreserverModule

  def initialize
    @books = []
    @albuns = []
    @movies = []
    @games = []
    @labels = []
    @genres = []
    @sources = []
    @authors = []

    load_data
  end

  def add_book(publish_date, publisher, cover_state, title, color)
    new_book = Book.new(publish_date, publisher, cover_state)
    new_label = Label.new(title, color)
    new_book.add_label(new_label)

    book_hash = {
      'id' => new_book.id,
      'publish_date' => new_book.publish_date,
      'publisher' => new_book.publisher,
      'cover_state' => new_book.cover_state,
      'label' => {
        'title' => new_book.label.title,
        'color' => new_book.label.color
      }
    }

    label_hash = {
      'id' => new_book.label.id,
      'title' => new_book.label.title,
      'color' => new_book.label.color
    }

    @books << book_hash
    @labels << label_hash
  end

  def list_all_books
    puts 'BOOKS LIST: '
    @books.each do |book|
      puts "\n ID: #{book['id']}, Title: #{book['label']['title']},
            Color:#{book['label']['color']},
            Publish date: #{book['publish_date']},
            Publisher: #{book['publisher']},
            Cover State: #{book['cover_state']}"
    end
  end

  def list_all_labels
    puts 'LABELS LIST:'
    @labels.each do |label|
      puts "ID: #{label['id']}, Title: #{label['title']}, Color:#{label['color']}"
    end
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    new_album_instance = MusicAlbum.new(on_spotify, album_name, publish_date)
    new_genre_instance = Genre.new(genre_name)
    new_album_instance.genre = new_genre_instance

    hash = {
      'album_name' => new_album_instance.name,
      'publish_date' => new_album_instance.publish_date,
      'on_spotify?' => new_album_instance.on_spotify,
      'genre' => new_genre_instance.name
    }

    genre_hash = {
      'genre_name' => new_genre_instance.name
    }

    @albums << hash
    @genres << genre_hash
  end

  def list_all_albums
    puts "\nNote: No albums available." if @albums.empty?

    puts "\n----------------------------"
    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    puts '-------------------------------------------------------'
    @albums.each do |album|
      p album
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?']
      .to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date']
      .to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
    end
  end

  def list_all_genres
    puts "\nNote: No genres available." if @genres.empty?

    puts "\n----------------------------"
    puts "\nALL GENRES\n\n"
    puts "\Name"
    puts '----------------------------'
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end

  def add_game(publish_date, multiplayer, last_played_at, first_name, last_name)
    new_game = Game.new(publish_date, multiplayer, last_played_at)
    new_author = Author.new(first_name, last_name)
    new_game.add_author(new_author)

    game_hash = {
      'publish_date' => new_game.publish_date,
      'multiplayer' => new_game.multiplayer,
      'last_played_at' => new_game.last_played_at,
      'author' => {
        'first_name' => new_game.author.first_name,
        'last_name' => new_game.author.last_name
      }
    }

    author_hash = {
      'first_name' => new_game.author.first_name,
      'last_name' => new_game.author.last_name
    }

    @games << game_hash
    @authors << author_hash
  end

  def list_all_games
    puts 'GAMES LIST: '
    @games.each do |game|
      puts "\n  Game publish date: #{game['publish_date']}, multiplayer:#{game['multiplayer']}"
    end
  end

  def list_all_authors
    puts 'AUTHORS LIST:'
    @authors.each do |author|
      puts "Author First Name: #{author['first_name']}, Author Last Name: #{author['last_name']}"
    end
  end

  def preserve_files
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
    save_data_as_json(@books, 'books')
    save_data_as_json(@labels, 'labels')
    save_data_as_json(@games, 'games')
    save_data_as_json(@authors, 'authors')
  end

  private

  def load_data
    @albums = load_file('albums')
    @genres = load_file('genres')
    @books = load_file('books')
    @labels = load_file('labels')
    @games = load_file('games')
    @authors = load_file('authors')
  end
end
