require 'colorize'

# The Formatter is responsible for printing the results to the user.
# At this time it simply prints to the terminal. 
# In future versions there may be options to specify where to print to.
# Passing tests are represented with a dot (.)
# Failing tests will print out what line the doctest is on,
# the expression, what was expected and what the expression 
# actually evaluated to.

module Dest

  class Formatter

    @@fail_count = 0

    def initialize(evald_result)
      @evald_result = evald_result
    end

    def print
      if @evald_result[:result][0]
        print_passing_test
      else
        @@fail_count += 1
        print_failing_test
      end

    end

    def self.print_end_test_message(time_taken, total_tests)
      puts "Finished in #{time_taken} seconds \n" + 
           "#{total_tests} tests,".green + "#{@@fail_count} failures".red 
    end

    private
      # Explicitly call Kernel as theres a name conflict
      # with my Formatter.print method
      def print_passing_test
        Kernel.print ".".green
      end

      def print_failing_test
        puts "\n    #{@@fail_count}) Test in #{@evald_result[:file_path]} failed on line #{@evald_result[:result][1]}".red + 
             "\n          Expected: #{@evald_result[:result][2].cyan} " + 
             "\n          To Equal: #{@evald_result[:result][3].to_s.cyan} " +
             "\n           But got: #{@evald_result[:result][4].to_s.cyan} \n"
      end

  end

end