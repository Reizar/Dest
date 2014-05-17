# The loader is responsible for requiring any parsed files.
# The reason these files are required is that in order to 
# evaluate their expression, the code must be loaded and
# accessible.

module Dest

  class Loader

    def self.load_files(filepaths)
      filepaths.each { |path| require path }
    end

    def self.rails_project
      require File.expand_path('../../load_paths', __FILE__)
      require 'rails/all'
      require 'active_support/all'
    end

  end

end