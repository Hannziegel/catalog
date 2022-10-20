require_relative '../music_album/genre'
require_relative '../item'

describe Genre do
  before(:each) do
    @genre = Genre.new('pop')
  end

  it 'has name to be pop' do
    expect(@genre.name).to eq 'pop'
  end
end
