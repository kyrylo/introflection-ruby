Gem::Specification.new do |s|
  s.name         = 'introflection'
  s.version      = File.read('VERSION')
  s.date         = Time.now.strftime('%Y-%m-%d')
  s.summary      = 'Introflection'
  s.description  = 'Introflection!'
  s.author       = 'Kyrylo Silin'
  s.email        = 'silin@kyrylo.org'
  s.homepage     = 'http://kyrylo.org/posts/introflection'
  s.licenses     = 'zlib'

  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n")

  s.add_development_dependency 'bundler', '~> 1.7'
end
