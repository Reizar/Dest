# Returns the sum of two numbers
# This test is meant to fail
# >> sum(5, 5)
# => 10
def sum(num1, num2)
  num1 * num2
end

# Concats two strings
# Into a new awesome string!
# >> concat("hello", " world")
# => "hello world"
def concat(str1, str2)
  str1 + str2
end

# Calculates the factorial of a given number n
# This test is meant to fail
# >> factorial(5)
# => 130
def factorial(n)
  (1..n).reduce(:*) || 1
end

# Some random comments to make sure they're ignored
#blah