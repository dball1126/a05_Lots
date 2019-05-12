require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
        prc ||= Proc.new{ |x, b| x += b }

        self.each do |accumulator, el|

          accumulator = prc.call(accumulator, el)
        end
        accumulator
   end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
    return 2 if num == 2
    (2...num).each do |n|
      return false if num % n == 0
    end
    true
end

def primes(num)
    primes = []
   (2..num*100).each do |n|
      primes << n if is_prime?(n)
      return primes if primes.length == num
   end
   primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
      return 1 if num == 0 
      return [1] if num == 1
        fact = [1]

        fact << [(fact[-1] * factorials_rec(num-1))]
#  (2) 
#     4 * fact_rc(3)  2
#     3 * fact_rc(2)  6
#     2 * fact_rc(1) 2
#     1 * fact(rc 0 )
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
      # hash = Hash.new{ |h, k| h[k] = [] }
          new_hash = Hash.new{ |h, k| h[k] = [] }
       self.each_with_index do |el, idx|

            hash[el] << idx
       end        
         hash = hash.sort_by{|k, v| v }
         new_hash = {}
         hash.each_with_index do |el, idx1|
            hash.each_with_index do |el, idx2|
              if idx+1 <= hash.length-1
                new_hash[idx] = 
              end
            end
          end

  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings

  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
          prc ||= Proc.new{ |a, b| a <=> b }

        arr = self.dup  
        return [] if arr.empty?
        return arr if arr.length == 1

        

        mid = arr.length / 2 
        left = arr.take(mid).merge_sort(&prc)
        right = arr.drop(mid).merge_sort(&prc)


        arr.merge(left, right, &prc)

  end

  private
  def self.merge(left, right, &prc)

        merged = []

          until left.empty? || right.empty?
              case prc.call(left.first, right.first) 
                when 1 
                  merged << left.shift 
                when 0 
                  merged << left.shift 
                when -1
                  merged << right.shift 
                end 
              


            merged + left + right  
              end
  end
end
