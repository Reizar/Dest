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
    end

  end

end