# The Evaluator is responsible for checking whether a doctest
# expression actually equals the expected result. 
# Its a simple eval() call which evaluates the code.
# The code should be loaded into memory thanks to the Loader

module Dest

  class Evaluator

    def initialize(parsed_attributes)
      @parsed_attributes = parsed_attributes
    end

    # Evaluates a doctest to see if the expression 
    # matches the result. 
    # Only true is returned if it matches as the formatter
    # is only going to print out a dot. 
    # False provides the needed details for the formatter.
    def evaluate
      expr_result = eval(@parsed_attributes[1])

      if expr_result == eval(@parsed_attributes[2])
        [true]
      else
        [false, @parsed_attributes[0], @parsed_attributes[1], @parsed_attributes[2], expr_result]
        # false,    line number,        expression,           expected_result,      actual_result
      end
    end

  end

end