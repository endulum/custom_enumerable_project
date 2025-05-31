module Enumerable
  def my_all?
    flag = true
    self.my_each do |element|
      flag = false unless (yield element)
    end
    return flag
  end

  def my_any?
    flag = false
    self.my_each do |element|
      if (yield element)
        flag = true
        break
      end
    end
    return flag
  end

  def my_none?
    flag = true
    self.my_each do |element|
      if (yield element)
        flag = false
        break
      end
    end
    return flag
  end

  def my_count(obj = nil)
    count = 0
    if obj
      self.my_each { |element| count += 1 if element == obj }
    elsif block_given?
      self.my_each { |element| count += 1 if (yield element) }
    else
      self.my_each { count += 1 }
    end
    return count
  end

  def my_inject(initial_value = 0)
    accumulator = initial_value
    self.my_each { |element| accumulator = yield accumulator, element }
    return accumulator
  end

  def my_map
    mapped = []
    self.my_each { |element| mapped.push(yield element) }
    return mapped
  end

  def my_select
    selected = []
    self.my_each do |element|
      if (yield element)
        selected.push(element)
      end
    end
    return selected
  end
end

class Array
  def my_each
    for element in self 
      yield element 
    end
    self
  end

  def my_each_with_index
    index = 0
    for element in self 
      yield element, index
      index += 1
    end
    self
  end
end
