class Greeter

  def initialize(name)
    @name = name
  end

  # Says hello to the person
  # >> Greeter.new("Aaron").say_hello
  # => "Hello Aaron"
  def say_hello
    "Hello #{@name}"
  end

  # Greets a person with class
  # >> Greeter.greet("Aaron")
  # => "Good morrow Sir Aaron"
  def self.greet(name)
    "Good morrow Sir #{name}"
  end

end