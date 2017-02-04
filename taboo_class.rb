require 'test/unit'
# taboo words: class
#
# class MyClass < Array
#   def my_method
#     'Hello!'
#   end
# end
#
c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

Object.const_set(:MyClass, c)

# Test
#
class TestMyclass < Test::Unit::TestCase
  def test_my_method
    assert_equal 'Hello!', MyClass.new.my_method
  end
end
