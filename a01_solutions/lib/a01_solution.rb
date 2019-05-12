# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?

  midpoint = arr.length / 2
  case target <=> arr[midpoint]
  when -1
    binary_search(arr[0...midpoint], target)
  when 0
    midpoint
  when 1
    subproblem_answer = binary_search(arr[(midpoint + 1)..-1], target)
    (subproblem_answer.nil?) ? nil : (midpoint + 1) + subproblem_answer
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    self.each_with_index do |el, first_idx|
      ((first_idx + 1)...self.length).each do |second_idx|
        if el + self[second_idx] == target
          pairs << [first_idx, second_idx]
        end
      end
    end
    pairs
  end
end

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num - 1)
    facs << facs.last * (num - 1)
    facs
  end
end

class String
  # This method returns true if the words in the string can be rearranged to form the
  # sentence passed as an argument. Words are separated by spaces.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    self.split.sort == other.split.sort
  end
end

# Write a method that returns the largest prime factor of a number
def largest_prime_factor(num)
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end
  
  nil
end

# You are not required to implement this; it's here as a suggestion :-)
def prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
    result = []
    i = 0
    while i < length
      result << prc.call(self[i])
      i += 1
    end
    result
  end
end

