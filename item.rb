require 'date'
require 'securerandom'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(publish_date)
    @id = SecureRandom.random_number(1000)
    @publish_date = Date.strptime(publish_date, '%Y/%m/%d')
    @current_date = DateTime.now
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = self.can_be_archived?
  end

  private

  def can_be_archived?
    (@current_date - @publish_date) > 10
  end
end
