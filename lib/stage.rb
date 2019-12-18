class Stage

  @@stages = {}
  @@total_rows = 0

  attr_reader :name, :genre, :id

  def initialize (name, genre, id)
    @name = name
    @genre = genre
    @id = id || @@total_rows += 1
  end

  def ==(other_stage)
    self.name.eql?(other_stage.name)
    self.genre.eql?(other_stage.genre)
  end

  def self.clear
    @@stages = {}
  end

  def self.all
    @@stages.values
  end

  def save()
    @@stages[self.id] = Stage.new(self.name, self.genre, self.id)
  end

  def self.find(id)
    @@stages[id]
  end

  def update(name, genre)
    @name = (name == '') ? self.name : name
    @genre = (genre == '') ? self.genre : genre
  end

  def delete
    @@stages.delete(self.id)
  end

  def self.search(query)
    Stage.all.select { |stage| stage.name.match?(/(#{query})/i)}
  end

  def self.sorted()
    Stage.all.sort_by { |stage| stage.name }
  end
end
