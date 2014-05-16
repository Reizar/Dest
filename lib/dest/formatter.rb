require 'colorize'

module Dest

  class Formatter

    @@fail_count = 1

    def initialize(evald_result)
      @evald_result = evald_result
    end

    def print
      if @evald_result[:result][0]
        print_passing_test
      else
        print_failing_test
        @@fail_count += 1
      end

    end

    private
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