require 'rspec'
require 'dest'
require'./spec/class_example.rb'

describe Dest::Evaluator do 

  it "should return true for a parsed doctest that is correct" do 
    doctest = [7, "Greeter.new(\"Aaron\").say_hello", "\"Hello Aaron\""]

    Dest::Evaluator.new(doctest).evaluate.first.should == true
  end

  it "should return false for a parsed doctest that is incorrect" do 
    doctest = [7, "Greeter.new(\"Aaron\").say_hello", "\"Hello DifferName\""]

    Dest::Evaluator.new(doctest).evaluate.first.should == false
  end

  it "should raise an error if a non contextd class is referenced" do 
    doctest = [7, "SomeClass.new(\"Aaron\").say_hello", "\"Hello DifferName\""]

    expect { Dest::Evaluator.new(doctest).evaluate }.to raise_error
  end
end