$:.push File.expand_path("../lib", __FILE__)
require "suku"

Gem::Specification.new do |s|
  s.name        = "suku"
  s.version     = Sudoku::VERSION
  s.authors     = ["Lee-Jon Ball"]
  s.email       = ["leejonball@gmail.com"]
  s.homepage    = "http://github.com/lee-jon/suku"

  s.summary     = "Wage war on 9x9 grids"
  s.description = "The Ruby library for manipulating, generating and solving sudoku puzzles"

  s.require_paths = %w[lib]

  # Dependencies for development
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.test_files  = Dir.glob("spec/**.*,rb")
end
