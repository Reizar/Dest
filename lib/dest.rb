require_relative "dest/version"

module Dest

  def self.test_file(file_path)
    parsed_output = Parser.parse(file_path)
    result = Evaluator.new(parsed_output).evaluate

    result_for_formatting = {:file_path => file_path, :result => result}
    Formatter.new(result_for_formatting).print
  end

end
