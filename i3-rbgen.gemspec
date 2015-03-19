# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'i3-rbgen'
  spec.version       = File.read('VERSION')
  spec.authors       = ['scott m parrish']
  spec.email         = ['anithri@gmail.com']
  spec.summary       = %q{status bar generators that communicate via dbus.}
  spec.description   = %q{For use with the https://github.com/acrisci/i3-dstatus project}
  spec.homepage      = 'https://github.com/anithri/i3-rbgen'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'virtus'
  spec.add_dependency 'ruby-dbus'
  spec.add_dependency 'weather-api'
  spec.add_dependency 'rufus-scheduler', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'version', '~> 1.0.0'
end
