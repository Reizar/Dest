require "dest/version"
require "dest/parser"
require "dest/evaluator"
require "dest/formatter"
require "dest/loader"

module Dest

  @@num_tests = 0


  def self.test_single(file_path)
    self.run_tests([file_path])
  end

  def self.test_directory(dir_path)
    filepaths = Dir.glob("#{dir_path}/**/*.rb")
    self.run_tests(filepaths)
  end

  def self.run_tests(filepaths)
    start_time = Time.now
    Loader.load_files(filepaths)

    filepaths.each { |path| self.test_file(path) }

    time_taken = Time.now - start_time
    Formatter.print_end_test_message(time_taken, @@num_tests)
  end

  def self.test_file(file_path)
    parsed_output = Parser.parse(file_path)
    parsed_output.each do |test| 
      @@num_tests += 1
      result = Evaluator.new(test).evaluate

      result_for_formatting = {:file_path => file_path, :result => result}
      Formatter.new(result_for_formatting).print
    end
  end

end
