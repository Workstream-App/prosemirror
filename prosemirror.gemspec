lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prosemirror/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.7.0'

  spec.name          = 'prosemirror'
  spec.version       = Prosemirror::VERSION
  spec.authors       = ['Workstream']
  spec.email         = ['engineering@workstream.io']

  spec.summary       = 'Takes ProseMirror compatible JSON and outputs HTML or text.'
  spec.description   = 'Takes ProseMirror compatible JSON and outputs HTML or text.'
  spec.homepage      = 'https://github.com/Workstream-App/prosemirror'

  # Prevent pushing this gem to RubyGems.org.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'https://gems.workstream.io'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
end
