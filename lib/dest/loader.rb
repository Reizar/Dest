module Dest

  class Loader

    def self.single_file(filepath)
      require filepath
    end

    def self.multiple_files(filepaths) # Array of filepaths
      filepaths.each { |path| require path }
    end

    def self.rails_project
      require File.expand_path('../../load_paths', __FILE__)
      require 'rails/all'
      require 'active_support/all'
    end

  end

end