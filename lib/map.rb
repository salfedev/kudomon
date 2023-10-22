class Map
  attr_reader :rows, :columns
  def initialize(rows = 10, columns = 10)
    @rows = rows
    @columns = columns
    @grid = Array.new(rows) { Array.new(columns) }
  end

  def add(row, column, object)
    @grid[row][column] = object
    object.position = [row, column]
  end

  def get(row, column)
    @grid[row][column]
  end

  def delete(row, column)
    key = get(row, column)
    @grid.delete(key)
  end

  def show
    @grid
  end
end