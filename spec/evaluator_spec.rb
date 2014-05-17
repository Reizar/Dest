require 'dest'
require 'class_example'

describe Dest::Evaluator do 

  it "should return true for a parsed doctest that is correct" do 
    doctest = [7, "Greeter.new(\"Aaron\").say_hello", "\"Hello Aaron\""]

    Dest::Evaluator.new(doctest).evaluate.first.should == true
  end

  it "should return false for a parsed doctest that is incorrect" do 
    doctest = [7, "Greeter.new(\"Aaron\").say_hello", "\"Hello DifferName\""]

    Dest::Evaluator.new(doctest).evaluate.first.should == false
  end
end