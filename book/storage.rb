require_relative './book'
require_relative './label'
require 'json'

module Storage
  def save_book(book)
    json_book = JSON.generate({ publish_date: book.publish_date,
                                publisher: book.publisher,
                                cover_state: book.cover_state })
    File.write('books.json', "#{json_book}\n", mode: 'a')
  end

  def load_books(books)
    return unless if File.exist?('books.json')
                    File.foreach('books.json') do |line|
                      object = JSON.parse(line)
                      books.push(Book.new(object[publish_date], object[publisher], object[cover_state]))
                    end
                  end
  end
end
