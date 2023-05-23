class Triangle
  class TriangleError < StandardError
  end

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid?
    (@side1 + @side2 > @side3) && (@side2 + @side3 > @side1) && (@side3 + @side1 > @side2)
  end

  def kind
    return :invalid unless valid?

    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side3 == @side1
      :isosceles
    else
      :scalene
    end
  end

  def perimeter
    @side1 + @side2 + @side3
  end

  def area
    s = perimeter / 2.0
    Math.sqrt(s * (s - @side1) * (s - @side2) * (s - @side3))
  end
end

triangle = Triangle.new(0, 0, 5)
puts triangle.kind #equilateral

triangle = Triangle.new(5, 5, 8)
puts triangle.kind  #isosceles

triangle = Triangle.new(3, 4, 5)
puts triangle.kind #scalene

triangle = Triangle.new(1, 1, 10)
puts triangle.kind #invalid
