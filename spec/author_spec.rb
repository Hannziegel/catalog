require_relative 'spec_helper'

describe Author do
  before(:each) do
    @author1 = Author.new('EA', 'Sports')
    @fifa23 = Game.new('2022/09/26', 'yes', '2022/10/19')
    @madden23 = Game.new('2022/09/08', 'no', '2022/10/20')
  end

  context 'Testing the Author class' do
    it 'Should be an instance of Author class' do
      expect(@author1).to be_an_instance_of Author
    end

    it 'Check first name of the author ' do
      expect(@author1.first_name).to eq('EA')
    end

    it 'Check last name of the author ' do
      expect(@author1.last_name).to eq('Sports')
    end

    it 'Check author item' do
      @author1.add_item(@fifa23)
      @author1.add_item(@madden23)
      expect(@author1.items.size).to eq(2)
    end
  end
end
