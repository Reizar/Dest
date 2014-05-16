require 'colorize'

module Dest

  class Formatter

    def initialize(evald_result)
      @evald_result
    end

    def print
      if @evald_result[:result][0]
        print_passing_test
      else
        print_failing_test
      end
    end

    private
      def print_passing_test
        ".".green
      end

      def print_failing_test

      end

  end

end