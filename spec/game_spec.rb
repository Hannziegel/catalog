require_relative '../game/game'

describe Game do
  before(:each) do
    @fifa23 = Game.new('2012/8/9', 'Yes', '2019/9/9')
    @madden23 = Game.new('2020/9/28', 'no', '2022/10/9')
  end

  context 'testing the game class' do
    it 'Should an instance of Game class' do
      expect(@fifa23).to be_an_instance_of Game
    end

    it 'Should can_be_archieved equal to true' do
      expect(@fifa23.move_to_archive).to eq(true)
    end

    it 'Should can_be_archieved equal to false' do
      expect(@madden23.move_to_archive).to eq(false)
    end
  end
end
