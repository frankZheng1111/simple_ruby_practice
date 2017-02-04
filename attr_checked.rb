module CheckedAttributes
  def self.included(base)
    base.extend AttrChecked
  end

  module AttrChecked
    def attr_checked(attr_name)
      define_method attr_name.to_s do
        self.instance_variable_get("@_#{attr_name}")
      end

      define_method "#{attr_name.to_s}=" do |arg, &rule|
      raise 'need a block' unless block_given?
      raise "#{attr_name.to_s} is invalid" unless yield(arg)
      self.instance_variable_set("@_#{attr_name}", arg)
      end
    end
  end
end

# Test
#
class Person
  include CheckedAttributes
  attr_checked :age do |v|
    v > 10
  end
end

person = Person.new

person.age = 15
p person.age

person.age = 1
p person.age
