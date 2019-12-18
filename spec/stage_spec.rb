require('stage')
require('rspec')


describe('.Stage') do

  before(:each) do
    @stage1 = Stage.new('Shred Factory', 'Rock', nil)
    @stage2 = Stage.new('Beat Shop', 'Hip Hop', nil)
    @stage1.save
    @stage2.save
  end

  after(:each) do
    Stage.clear
  end

  describe ('#==') do
    it('is the same stage if it hs the same attributes') do
      stage3 = Stage.new('Stage 1', 'Rock', nil)
      expect(@stage1).to(eq(stage3))
    end
  end

  describe ('#save') do
    it('saves a stage') do
      expect(Stage.all).to(eq([@stage1, @stage2]))
    end
  end

  describe ('#clear') do
    it('clears all stages') do
      Stage.clear
      expect(Stage.all).to(eq([]))
    end
  end

  describe ('#find') do
    it('finds a stage by id') do
      expect(Stage.find(@stage1.id)).to(eq(@stage1))
    end
  end

  describe ('#update') do
    it('updates values of a stage') do
      @stage1.update("Rockers", "")
      expect(@stage1.name).to(eq('Rockers'))
      expect(@stage1.genre).to(eq('Rock'))
    end
  end

  describe ('#delete') do
    it('deletes a stage') do
      @stage1.delete
      expect(Stage.all).to(eq([@stage2]))
    end
  end

  describe ('#search') do
    it('returns an array of stages by partial match name') do
      stage3 = Stage.new("Fape Bounce", "Electronica", nil)
      stage3.save
      expect(Stage.search('Fa')).to(eq([@stage1, stage3]))
    end
  end

end
