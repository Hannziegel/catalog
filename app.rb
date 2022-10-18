class App
  def initialize
    @books = []
    @albuns = []
    @movies = []
    @games = []
    @labels = []
    @genres = []
    @sources = []
    @authors = []
  end

  def self.options
    puts "\n"
    puts 'Please select and option by entering a number: '
    puts "\n"

    @list = {
      ' 1' => 'List all books',
      ' 2' => 'List all music albums',
      ' 3' => 'List all movies',
      ' 4' => 'List all games',
      ' 5' => 'List all genre',
      ' 6' => 'List all labels',
      ' 7' => 'List all authors',
      ' 8' => 'List all sources',
      ' 9' => 'Add a book',
      '10' => 'Add a music album',
      '11' => 'Add a movie',
      '12' => 'Add a game',
      '13' => 'Exit'
    }

    @list.each do |index, string|
      puts "#{index} - #{string}"
    end
    Integer(gets.chomp)
  end

  loop do
    case options
    when 1
      p 'Option 1 not implemented yet '
    when 2
      p 'Option 2 not implemented yet '
    when 3
      p 'Option 3 not implemented yet '
    when 4
      p 'Option 4 not implemented yet '
    when 5
      p 'Option 5 not implemented yet '
    when 6
      p 'Option 6 not implemented yet '
    when 7
      p 'Option 7 not implemented yet '
    when 8
      p 'Option 8 not implemented yet '
    when 9
      p 'Option 9 not implemented yet '
    when 10
      p 'Option 10 not implemented yet '
    when 11
      p 'Option 11 not implemented yet '
    when 12
      p 'Option 12 not implemented yet '
    when 13
      p 'Good bye!'
      exit
    end
  end
end