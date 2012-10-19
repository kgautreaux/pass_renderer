# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "pass_renderer"
  s.summary = "Custom rails engine to render passbook passes."
  s.description = "Uses magic to render and sign passbook passes using the rails rendering pipeline."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.version = "0.0.2"
  s.add_dependency "passbook", ">= 0.0.3"
end