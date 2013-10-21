**This gem does not yet work.**

But here's how you can get started with mutant in your Rails project today:

In your Gemfile (the order of the gems matters):

```ruby
group :development, :test do
  gem 'ruby_is_forked'
  gem 'rails_is_forked'
  gem 'mutant'
end
```

Remove the line `require 'rspec/autorun'` from `spec/spec_helper`. You should be good to run. Here's your command line, assuming you want to test the User model:

```
mutant -r ./config/environment --rspec User
```

More generically:

```
RAILS_ENV=test mutant -r ./config/environment --rspec [model class]
```

You can also test, specific methods:

Instance:

```
RAILS_ENV=test mutant -r ./config/environment --rspec User#my_instance_method
```
Class:

```
RAILS_ENV=test mutant -r ./config/environment --rspec User.my_class_method
```

Caveats
-------
You may run into issues if you have `require 'rspec/autorun'` or `config.filter_run focus: true`. You can get around this by putting them in a conditional such as:

```ruby
if ENV['MUTANT'] == 'true'
  config.filter_run focus: true
end
```

and then prepend `MUTANT=true` to the above commands. Maybe toss it into a handy helper method in your `spec_helper.rb`:

```ruby
def mutant?
  ENV['MUTANT'] == 'true'
end
```

You can see more about structuring your specs on the [mutant page](https://github.com/mbj/mutant).

A script to help you switch to the dm2 style of specs: https://gist.github.com/mockdeep/7051285

Better documentation to come as I learn more...
