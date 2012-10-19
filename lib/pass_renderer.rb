require "action_controller"
require "passbook"
Mime::Type.register "application/vnd.apple.pkpass", :pkpass

ActionController::Renderers.add :pkpass do |object, options|
  begin
    pass = Passbook::PKPass.new(PassRenderer::Template.render(object))
    pass.addFiles(object.respond_to?(:files) ? object.files : options.fetch(:files))
    pkpass_path = pass.create
    send_file pkpass_path, type: 'application/vnd.apple.pkpass', disposition: 'attachment', filename: "#{object.name}.pkpass"
  rescue RuntimeError => e
    if e.message =~ /missing/
      if object.respond_to?(:files)
        raise "#{e.message}.  Please return an array of file paths from the files method of your data object."
      else
        raise "#{e.message}.  Please add the full file path to the array of files passed to the render method in your controller."
      end
    end
  end
end

module PassRenderer
  def self.configure
    @config = {}
    yield @config
  end

  def self.config
    @config
  end

  class Template
    def self.render(object)
      @pass = object
      # template = ERB.new(File.read(File.expand_path("../assets/json/pass.json.erb", __FILE__)))
      template = ERB.new(File.read(PassRenderer.config[:template]))
      result = template.result(binding)
      Rails.logger.warn(result)
      result
    end
  end
end
