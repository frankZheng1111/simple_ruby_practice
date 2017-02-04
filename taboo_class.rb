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

p MyClass.new.my_method # => Hello!
