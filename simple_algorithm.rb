require "test/unit"

class SimpleAlgorithm
  def quick_sort(numbers)
    return numbers if numbers.size <= 1
    smaller_numbers = []
    larger_numbers = []
    point = numbers.first
    other_numbers = numbers.reverse
    other_numbers.pop()
    other_numbers.each do |number|
      smaller_numbers << number if number <= point
      larger_numbers << number if number > point
    end
    sort_numbers = [ quick_sort(smaller_numbers), [point], quick_sort(larger_numbers) ]
    sort_numbers.flatten
  end
end

class TestSimpleAlgorithm < Test::Unit::TestCase
  setup do
    @simple_algorithm = SimpleAlgorithm.new
  end

  def test_quick_sort
    sort_numbers = @simple_algorithm.quick_sort([6, 8, 9, 0, 1, 3, 4, 5, 6, 4, 2])
    assert_equal [0, 1, 2, 3, 4, 4, 5, 6, 6, 8 ,9], sort_numbers
  end
end
