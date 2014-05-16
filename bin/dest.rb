#!/usr/bin/env ruby

begin
  require 'dest'
rescue LoadError
  require 'rubygems'
  require 'dest'
end

# Do a check for rails in here.

if ARGV[0]
  if File.file?(ARGV[0])
    Dest.test_single(ARGV[0])
  elsif File.directory?(ARGV[0])
    dir =  ARGV[0][-1] == "/" ? ARGV[0] : "#{ARGV[0]}/"  # Add trailing slash if it isn't present
    Dest.test_directory(dir)
  else
    puts "#{ARGV[0]} is not a valid file or directory"
  end
else 
  Dest.test_dir
end