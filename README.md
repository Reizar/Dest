# Dest

Dest is a lightweight gem for implementing doctest's in ruby. 

Dest is inspired by doctest features in languages like Python and Elixir, mainly 
made for methods that are more functional in nature.
Dest allows you to provide testable examples inside of your codes documentation 
to illustrate the expected usage of a method

Dest does not currently support rails applications, but a separate 
dest-rails gem is planned.

## Installation

Add this line to your application's Gemfile:

    gem 'dest'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dest

## Usage

To use Dest, have commented documentation above your method that has the following two lines:

  # >> expression
  # => expected_result

The => line must be immediately after the >> line. There can be any amount of spaces before or after the #

Then from your console, execute `dest /path_to/file.rb`
You can also use the dest command on a directory to test every .rb file within that directory and any 
subdirectories of the directory.

Also, Dest can not infer context. So if a method is an instance method of a class, you must explicitly use
the class name and instantiate a new object. eg: `User.new(:name => "fred").first_name`
See http://github.com/Reizar/Dest/blob/master/spec/class_example.rb for an example of a class
using Dest.

Here is an example file named `example.rb` that implements Dest doctests.

```ruby

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

```

I then run `dest example.rb` in my terminal. And will get an output like this:

```
    1) Test in /Users/aaron/Projects/gems/dest/spec/example.rb failed on line 2
          Expected: sum(5, 5) 
          To Equal: 10 
           But got: 25 
.
    2) Test in /Users/aaron/Projects/gems/dest/spec/example.rb failed on line 18
          Expected: factorial(5) 
          To Equal: 130 
           But got: 120 

Finished in 0.000728 seconds 
3 tests, 2 failures
```

Green dots are used to represent passing tests.
Red error messages represent failing tests.

## Contributing

1. Fork it ( https://github.com/Reizar/Dest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
