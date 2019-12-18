require('rspec')
require('stage')


describe ('.Stage')

  before(:each) do
    @stage1 = Stage.new('Stage 1', 'Rock', nil)
    @stage2 = Stage.new('Stage 2', 'Hip Hop', nil)
  end

  after(:each) do
    Album.clear
  end

  describe ('#==') do
    it('is the same stage if it hs the same attributes') do
    stage3 = Stage.new('Stage 1', 'Rock', nil)
    expect(@stage1).eq(stage3)
  end
end
