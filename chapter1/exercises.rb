# frozen_string_literal: true

# 1.) What is the definition of a closure?
# A function whose body references a variable
# that is declared in a parent scope.

# 2.) Identify the free variable in the following.

def larger_than(amount)
  lambda do |a|
    a > amount
  end
end

larger_than_five = larger_than(5)

p larger_than_five.call(4)
p larger_than_five.call(5)
p larger_than_five.call(6)

# amount

new_db = lambda do
  db = {}

  insert = lambda do |artist, album|
    db[artist] = album
  end

  dump = lambda do
    db
  end

  delete = lambda do |artist|
    old = db[artist]
    db[artist] = nil
    old
  end

  { insert:, dump:, delete: }
end

db = new_db.call
p db[:insert].call('Eagles', 'Hell Freezes Over')
p db[:insert].call('Pink Floyd', 'The Wall')
p db[:dump].call
p db[:delete].call('Pink Floyd')
p db[:dump].call

is_even = lambda(&:even?)

complement = lambda do |predicate|
  lambda do |args|
    !predicate.call(args)
  end
end

p complement.call(is_even).call(4)
p complement.call(is_even).call(5)

array = [1, 2, 3, 4, 5]

reducer = lambda do |acc, arr, binary_fuction|
  if arr.empty?
    acc
  else
    reducer.call(binary_fuction.call(acc, arr.first), arr.drop(1), binary_fuction)
  end
end

p reducer.call(1, array, ->(x, y) { x + y })

p reducer.call([], array, ->(acc, x) { acc << x * 2 })
