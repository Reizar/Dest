require "dest"

describe Dest::Parser do 

  it "successfully parses a file" do 
    parsed = Dest::Parser.parse("class_example.rb")

    parsed.should == [
      [7, "Greeter.new(\"Aaron\").say_hello", "\"Hello Aaron\""], 
      [14, "Greeter.greet(\"Aaron\")", "\"Good morrow Sir Aaron\""]
    ] 
  end


end