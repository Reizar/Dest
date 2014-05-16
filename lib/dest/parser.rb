module Dest

  class Parser

    EXPRESSION = /\s*#\s*>>\s*(?<expression>.*)/ # Matches the beginning of an expression
    RESULT     = /\s*#\s*=>\s*(?<result>.*)/ # Matches the beginning of a result

    def initialize(filename)
      @filename = filename
    end


    # Return value is a hash following this structure
    # { :filename => 'something.rb',
    #   :values => [ [1, 'sum(5, 5)', '10'] ]  ( Array of Arrays. [ line_number, expression, result])
    # }
    def parse
      parsed_output = []

      File.open(@filename).each_line.with_index do |line, num|
        next if line.lstrip[0] != "#"

        if expr = line.match(EXPRESSION)
          parsed_output.push [num, expr["expression"]]
        elsif result = line.match(RESULT)
          parsed_output.last.push(result["result"])
        end
      end
      parsed_output
    end

    def self.parse(filename)
      self.new(filename).parse
    end

  end

end