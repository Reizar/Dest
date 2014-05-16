module Dest

  class Evaluator

    def initialize(parsed_attributes)
      @parsed_attributes = parsed_attributes
    end

    def evaluate
      expr_result = eval(parsed_attributes[1])

      if expr_result == eval(parsed_attributes[2])
        [true]
      else
        [false, parsed_attributes[0], parsed_attributes[1], parsed_attributes[2], expr_result]
        # false,    line number,        expression,           expected_result,      actual_result
      end
    end

  end

end