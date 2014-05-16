class App

  # Returns the sum of two numbers
  # >> App.new.sum(5, 5)
  # => 10
  def sum(num1, num2)
    num1 * num2
  end

  # Concats two strings
  # Into a new awesome string!
  # >> App.new.concat("hello", " world")
  # => "hello world"
  def concat(str1, str2)
    str1
  end

  # Calculates the factorial of a given number n
  # >> App.new.factorial(5)
  # => 120
  def factorial(n)
    (1..n).reduce(:*) || 1
  end

  # Some random comments to make sure they're ignored
  #blah

end