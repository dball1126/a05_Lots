require 'rspec'
require 'spec_helper'
require 'a01_solution'

describe 'binary_search' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  it "returns nil if the array is empty" do
    expect(binary_search([], 11)).to be_nil
  end

  it "returns the index of a target" do
    expect(binary_search(arr, 33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(binary_search(arr, 22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(binary_search(arr, 66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    expect(binary_search(arr, 5)).to be_nil
  end

  it "does not call any blacklisted methods" do
    disallowed_methods = [
      :index, :find_index, :include?, :member?
    ]

    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end

    binary_search(arr, 5)
    binary_search(arr, 11)
  end

  it "calls itself recursively" do
    expect(self).to receive(:binary_search).exactly(3).times.and_call_original
    binary_search(arr, 11)
  end
end

describe "#pair_sum" do
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  it "returns positions of pairs of numbers that add to zero" do
    expect([5, 1, -7, -5].pair_sum(0)).to eq([[0, 3]])
  end

  it "returns positions of pairs that add to other targets" do
    expect([2, 1, 4, -2].pair_sum(5)).to eq([[1, 2]])
  end

  it "finds multiple pairs" do
    expect([5, -1, -5, 1].pair_sum(0)).to eq([[0, 2], [1, 3]])
  end

  it "finds pairs with same element" do
    expect([5, -5, -5].pair_sum(0)).to eq([[0, 1], [0, 2]])
  end

  it "returns [] when no pair is found" do
    expect([5, 5, 3, 1].pair_sum(7)).to eq([])
  end

  it "won't find spurious target pairs" do
    expect([0, 1, 2, 3].pair_sum(0)).to eq([])
  end
end

describe "#factorials_rec" do
  # Write a **recursive** implementation of a method that returns the
  # first `n` factorial numbers.
  # Be aware that the first factorial number is 0!, which is defined to
  # equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.

  it "returns first factorial number" do
    expect(factorials_rec(1)).to eq([1])
  end

  it "returns first two factorial numbers" do
    expect(factorials_rec(2)).to eq([1, 1]) # = [0!, 1!]
  end

  it "returns many factorials numbers" do
    expect(factorials_rec(6)).to eq([1, 1, 2, 6, 24, 120])
    # == [0!, 1!, 2!, 3!, 4!, 5!]
  end

  it "calls itself recursively" do
    # this should enforce you calling your method recursively.

    expect(self).to receive(:factorials_rec).at_least(:twice).and_call_original
    factorials_rec(6)
  end
end

# This method returns true if the sentence passed as an argument
# can be created by rearranging the receiver.
describe "shuffled_sentence_detector" do
  it "can detect a shuffled sentence" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate the cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(true)
  end

  it "doesn't return false positives" do
    sentence1 = "het act tea eth tar"
    sentence2 = "the cat ate the rat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "anagrams don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "tcatr hatha eteet"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end

  it "partial matches don't cause a false positive" do
    sentence1 = "the cat ate the rat"
    sentence2 = "the rat ate cat"
    expect(sentence1.shuffled_sentence_detector(sentence2)).to eq(false)
  end
end

# This method returns the largest factor of
# the number that is prime.
describe 'largest_prime_factor' do
  it 'returns 2 for 2' do
    expect(largest_prime_factor(2)).to eq(2)
  end

  it 'returns 5 for 10' do
    expect(largest_prime_factor(10)).to eq(5)
  end
  it 'can detect larger factors' do
    expect(largest_prime_factor(152)).to eq(19)
  end
  it 'can detect even larger factors' do
    expect(largest_prime_factor(2098)).to eq(1049)
  end

  it "returns original number if it is prime" do
    expect(largest_prime_factor(13)).to eq(13)
  end

  it 'returns nil for zero and one' do
    expect(largest_prime_factor(0)).to be_nil
    expect(largest_prime_factor(1)).to be_nil
  end
end

describe 'Array#my_each' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_each(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_each(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'does NOT call the Array#each or Array#map! method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:each)
    expect(original_array).not_to receive(:map!)
    original_array.my_each {}
  end

  it 'is chainable and returns the original array' do
    original_array = ["original array"]
    expect(original_array.my_each {}).to be(original_array)
  end
end

describe 'Array#my_map' do
  it 'calls the block passed to it' do
    expect do |block|
      ["test array"].my_map(&block)
    end.to yield_control.once
  end

  it 'yields each element to the block' do
    expect do |block|
      ["el1", "el2"].my_map(&block)
    end.to yield_successive_args("el1", "el2")
  end

  it 'runs the block for each element' do
    expect([1, 2, 3].my_map { |el| el * el }).to eq([1, 4, 9])
    expect([-1, 0, 1].my_map { |el| el.odd? }).to eq([true, false, true])
  end

  it 'does NOT call the built in Array#map method' do
    original_array = ["original array"]
    expect(original_array).not_to receive(:map)
    original_array.my_map {}
  end

  it 'is chainable and returns a new array' do
    original_array = ["original array"]
    expect(original_array.my_map {}).not_to eq(original_array)
  end
end

