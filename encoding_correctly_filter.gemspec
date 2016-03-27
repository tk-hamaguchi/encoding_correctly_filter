$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'encoding_correctly_filter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'encoding_correctly_filter'
  s.version     = EncodingCorrectlyFilter::VERSION
  s.authors     = ['Takahiro HAMAGUCHI']
  s.email       = ['tk.hamaguchi@gmail.com']
  s.homepage    = 'https://github.com/tk-hamaguchi/encoding_correctly_filter'
  s.summary     = 'Request encoding correctly filter'
  s.description = 'Request encoding correctly filter.'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 2.2.2'

  s.files = Dir[*%w({app,config,db,lib}/**/* MIT-LICENSE Rakefile README.md)]

  s.add_dependency 'actionpack', '~> 4.2'
  s.add_dependency 'activesupport', '~> 4.2'

  s.add_development_dependency 'rails', '~> 4.2.5'
  s.add_development_dependency 'sqlite3'
end
