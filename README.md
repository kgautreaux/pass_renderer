# PassbookRenderer #

## Installing: ##

Add the following to your gemfile:

```ruby
gem 'passbook_renderer'
```

then run `bundle install`.

## Configuring: ##

Add an initializer with the following:

```ruby
PassRenderer.configure do |config|
  config[:template] = File.expand_path('relative/path/from/this/file/to/your/template', __FILE__)
end
```

Now you just need an ERB template for rendering the json output.  Place it at the path you specified above.  There is a reference template in the included dummy app under the spec directory.  The template is located under `spec/dummy/app/assets/json` and is called `pass.json.erb`.

This project uses MIT-LICENSE.