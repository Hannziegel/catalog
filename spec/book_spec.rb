require_relative '../book/book'
require 'date'

describe Book do
  before(:each) do
    @book = Book.new('1935/10/31', 'Publisher', 'bad')
  end

  it 'It is an instance of Book' do
    expect(@book).to be_an_instance_of Book
  end

  it 'can_be_archived? equal to true' do
    expect(@book.move_to_archive).to be true
  end

  it 'publisher equal to be Publisher' do
    expect(@book.publisher).to eq 'Publisher'
  end

  it 'has publish_date to be 1935/10/31' do
    expect(@book.publish_date).to eq Date.strptime('1935/10/31', '%Y/%m/%d')
  end
end
