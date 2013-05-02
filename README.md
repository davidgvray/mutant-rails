This gem does not yet work. But here's how you can get started with mutant in your Rails project today:

In your Gemfile:

```ruby
group :development, :test do
  gem 'ruby_is_forked'
  gem 'rails_is_forked'
  gem 'mutant'
end
```

Remove the line `require 'rspec/autorun'` from `spec/spec_helper`. You should be good to run. Here's your command line, assuming you want to test the User model:

```
be mutant -I lib -d -r ./config/environment.rb -r ./app/models/user.rb --rspec-dm2 ::User
```

More generically:

```
be mutant -I lib -d -r ./config/environment.rb -r ./app/models/[model name].rb --rspec-dm2 ::[model class]
```

You can also test, specific methods:

Instance: `be mutant -I lib -d -r ./config/environment.rb -r ./app/models/user.rb --rspec-dm2 ::User#my_instance_method`
Class: `be mutant -I lib -d -r ./config/environment.rb -r ./app/models/user.rb --rspec-dm2 ::User.my_class_method`

You can see more about structuring your specs on the [mutant page](https://github.com/mbj/mutant).

Caveats
-------

If you're using any of the following gems you'll need to do some extra work:

* [database_cleaner](https://github.com/bmabey/database_cleaner)
* [vcr](https://github.com/vcr/vcr)
* [be_valid_asset](https://github.com/unboxed/be_valid_asset)

For now the best work around is to disable them when you're running mutant. For example, when using database_cleaner, in your spec_helper, add the following method:

```ruby
  def mutant?
    ENV['MUTANT'] == 'true'
  end
```

Set transactional fixtures as:

```ruby
  config.use_transactional_fixtures = mutant?
```

And nest your database cleaner logic inside an `unless` block:

```ruby
  unless mutant?
    config.before(:suite) do
      DatabaseCleaner.strategy...
      ...
    end
    ...
  end
```

Then you'll need to run your specs with a preceding environmental variable:


```
MUTANT=true be mutant -I lib -d -r ./config/environment.rb -r ./app/models/[model name].rb --rspec-dm2 ::[model class]
```
