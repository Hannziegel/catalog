module BookInput
  def get_input(input)
    print input.to_s
    gets.chomp
  end

  def input_add_book
    publish_date = get_input('Publish date [YYYY/MM/DD]: ')
    title = get_input('Title : ')
    color = get_input('Color : ')
    publisher = get_input('Publisher: ')
    cover_state = get_input('Cover State [Good/Bad]: ')
    cover_state.upcase

    @app.add_book(publish_date, publisher, cover_state, title, color)
    p "\n Book Created!"
  end
end
