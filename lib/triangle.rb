class Triangle

  # custom error 
  class TriangleError < StandardError
    def message
      "This is not a valid triangle"
    end
  end

  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c    
  end

  # valid triangle should satisfy these two conditions
  def greater_than_zero
    [side_a, side_b, side_c].all? { |side| side > 0 }
  end

  def sum_of_two_sides
    side_a + side_b > side_c && side_a + side_c > side_b && side_b + side_c > side_a
  end

  # therefore...
  def valid_triangle 
    raise TriangleError unless greater_than_zero && sum_of_two_sides
  
  end

  def kind
    valid_triangle
    if side_a==side_b && side_b==side_c && side_c==side_a
      :equilateral
    elsif side_a==side_b || side_b==side_c || side_c==side_a
      :isosceles
    else
      :scalene
    end
  end
end
