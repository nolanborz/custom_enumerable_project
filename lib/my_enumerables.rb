module Enumerable

  # Your code goes here
  def my_each_with_index
    if block_given?
      index = 0
      my_each do |element|
        yield(element, index)
        index += 1
      end
    end
    self
  end
  def my_select
    arr = []
    if block_given?
      my_each do |element|
        if yield(element)
          arr << element
        end
      end
      arr
    else
      self.to_enum(:my_select)
    end
  end
  def my_all?
    if block_given?
      my_each do |element|
        return false unless yield(element)
      end
    else
      my_each do |element|
        return false unless element
      end
    end
    true
  end
  def my_any?
    if block_given?
      my_each do |element|
        if yield(element)
          return true
       
        end
      end
    else
      my_each do |element|
        return true if element
      end
    end
    false
  end
  def my_none?
    if block_given?
      my_each do |element|
        return false if yield(element)
      end
    else
      my_each do |element|
        return false if element
      end
    end
    true
  end
  def my_count(*args)
    count = 0
    if block_given?
      my_each do |element|
        count += 1 if yield(element)
      end
    elsif args.size == 1
      my_each do |element|
        count += 1 if element == args[0]
      end
    else
      return size
    end
    count
  end
  def my_map
    new_arr = []
    if block_given?
      my_each do |element|
        new_arr << yield(element)
      end
    else
      my_each do |element|
        new_arr << element
      end
    end
    new_arr
  end
  def my_inject(initial = nil)
    if block_given?
      accumulator = initial.nil? ? first : initial
      my_each_with_index do |element, index|
        next if initial.nil? && index == 0
        accumulator = yield(accumulator, element)
      end
      accumulator
    elsif initial
      my_inject(initial) { |acc, elem| acc.send(self.first, elem) }
    else
      my_inject { |acc, elem| acc.send(self.first, elem) }
    end
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

  # Define my_each here

class Array
  def my_each
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i])
        i += 1
      end
    end
    self
  end
end
  

