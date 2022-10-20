require_relative '../music_album/music_album'
require 'date'

describe MusicAlbum do
  before(:each) do
    @musicalbum = MusicAlbum.new(false, 'Happiness', '1999/02/15')
  end

  it 'can has an instance' do
    expect(@musicalbum).to be_an_instance_of MusicAlbum
  end

  it 'has on_spotify to be false' do
    expect(@musicalbum.on_spotify).to be false
  end

  it 'has name to be Happiness' do
    expect(@musicalbum.name).to eq 'Happiness'
  end

  it 'has publish_date to be 15/02/1999' do
    expect(@musicalbum.publish_date).to eq Date.strptime('1999/02/15', '%Y/%m/%d')
  end
end
