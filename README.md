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
mutant -r ./config/environment --rspec [model class]
```

You can also test, specific methods:

Instance:

```
mutant -r ./config/environment --rspec User#my_instance_method
```
Class:

```
mutant -r ./config/environment --rspec User.my_class_method
```

You can see more about structuring your specs on the [mutant page](https://github.com/mbj/mutant).

A script to help you switch to the dm2 style of specs: https://gist.github.com/mockdeep/7051285

Better documentation to come as I learn more...
