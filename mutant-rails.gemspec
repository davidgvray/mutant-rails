Gem::Specification.new do |s|
  s.name = %q{mutant-rails}
  s.version = "0.0.1"
  s.date = %q{2012-05-01}
  s.authors = ["Robert Fletcher"]
  s.email = %q{lobatifricha@gmail.com}
  s.summary = %q{A rails adapter for mutant}
  s.homepage = %q{https://github.com/mockdeep/mutant-rails}
  s.description = %q{A rails adapter for mutant}

  s.add_dependency('mutant')
  s.add_dependency('ruby_is_forked')
  s.add_dependency('rails_is_forked')
end
