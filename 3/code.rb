TREE = '#'

def checkSlopes(map)
    slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    slopes.map { |slope| checkSlope(map, slope) }.inject(:*)
end

def checkSlope(map, slope)
    pos = { x: 0, y: 0 }
    trees = 0
    while pos != nil
        trees = trees + 1 if (posIsTree(map, pos))
        pos = nextPosition(map, pos, slope)
    end
    trees
end

def nextPosition(map, pos, slope)
    x = pos[:x] + slope[0]
    y = pos[:y] + slope[1]
    return nil if y >= map.length
    x -= map[0].length if x >= map[0].length
    { x: x, y: y }
end

def posIsTree(map, pos)
    map[pos[:y]][pos[:x]] == TREE
end

def main(input)
    map = input.split("\n").map(&:chomp).reject(&:empty?)
    checkSlopes(map)
end
