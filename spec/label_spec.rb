require_relative '../book/label'
require_relative '../item'

describe Label do
  before(:each) do
    @label = Label.new('titless', 'colorless')
  end

  it 'The title should be title' do
    expect(@label.title).to eq 'titless'
  end

  it 'The color should be color' do
    expect(@label.color).to eq 'colorless'
  end
end
