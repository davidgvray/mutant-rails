Gem::Specification.new do |spec|
  spec.name = %q{mutant-rails}
  spec.version = '0.0.2'
  spec.date = %q{2012-05-01}
  spec.authors = ['Robert Fletcher']
  spec.email = %q{lobatifricha@gmail.com}
  spec.summary = %q{A rails adapter for mutant}
  spec.homepage = %q{https://github.com/mockdeep/mutant-rails}
  spec.description = %q{A rails adapter for mutant}

  spec.add_dependency('mutant', '~> 0.2.20')
  spec.add_dependency('ruby_is_forked', '~> 0.0.1')
  spec.add_dependency('rails_is_forked', '~> 0.0.1')
end
