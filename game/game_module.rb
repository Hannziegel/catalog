module GameModule
  def get_input(input)
    print input.to_s
    gets.chomp
  end

  def add_new_game_details
    publish_date = get_input('Publish date [YYYY/MM/DD]: ')
    multiplayer = get_input('Title : ')
    last_played_at = get_input('Last played at [YYYY/MM/DD]: ')
    first_name = get_input('Author first name: ')
    last_name = get_input('Author last name: ')

    @app.add_game(publish_date, multiplayer, last_played_at, first_name, last_name)
    p "\n Game Created!"
  end
end
