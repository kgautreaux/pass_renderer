PassRenderer.configure do |config|
  config[:template] = File.expand_path('../../../app/assets/json/pass.json.erb', __FILE__)
end