require_relative '../item'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, _id = SecureRandom.random_number(1000))
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state.downcase
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
