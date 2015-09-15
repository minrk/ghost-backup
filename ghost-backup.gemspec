require 'date'

Gem::Specification.new do |s|
  s.name        = 'ghost-backup'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.summary     = 'Backup ghost blog data'
  s.description = 'Dump ghost database and assets to local disk'
  s.authors     = ['Min RK']
  s.email       = 'benjaminrk@gmail.com'
  s.homepage    = 'http://github.com/minrk/ghost-backup'
  s.license     = 'BSD'
  s.executables = ['ghost-backup']
  s.files       = `git ls-files`.split($/)
  s.require_paths = ['.']
  s.add_runtime_dependency 'commander', '~> 4.3'
  s.add_runtime_dependency 'highline', '~> 1.7'
  s.add_runtime_dependency 'rest-client', '~> 1.8'
end