require "dest/version"
require "dest/parser"
require "dest/evaluator"
require "dest/formatter"
require "dest/loader"

module Dest

  @@num_tests = 0

  def self.test_file(file_path)
    parsed_output = Parser.parse(file_path)
    parsed_output.each do |test| 
      @@num_tests += 1
      result = Evaluator.new(test).evaluate

      result_for_formatting = {:file_path => file_path, :result => result}
      Formatter.new(result_for_formatting).print
    end
  end

  def self.test_single(file_path)
    start_time = Time.now
    Loader.single_file(file_path)
    self.test_file(file_path)

    end_time = Time.now
    time_taken = end_time - start_time
    Formatter.print_end_test_message(time_taken, @@num_tests)
  end

  def self.test_directory(dir_path)
    start_time = Time.now
    filepaths = Dir.glob("#{dir_path}**/.rb")
    Loader.multiple_files(filepaths)

    filepaths.each do |path| 
      self.test_file(path)
    end

    end_time = Time.now
    time_taken = end_time - start_time
    Formatter.print_end_test_message(time_taken, @@num_tests)
  end

end
