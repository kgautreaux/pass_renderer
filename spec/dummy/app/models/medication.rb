class Medication < ActiveRecord::Base
  def files
    [File.expand_path('../../../public/images/icon.png', __FILE__),
     File.expand_path('../../../public/images/icon@2x.png', __FILE__),
     File.expand_path('../../../public/images/logo.png', __FILE__),
     File.expand_path('../../../public/images/logo@2x.png', __FILE__),
     File.expand_path('../../../public/images/thumbnail.png', __FILE__),
     File.expand_path('../../../public/images/thumbnail@2x.png', __FILE__)]
  end

  def format_version
    1
  end

  def pass_type_identifier
    "pass.medpass.medication"
  end

  def serial_number
    Integer(Random.rand * (10 ** 20))
  end

  def webservice_url
    "https://example.com/foo/"
  end

  def authentication_token
    "vxwxd7J8AlNNFPS8k0a0FfUFtq0ewzFdc"
  end

  def team_identifier
    "LARV89ZX9"
  end

  def locations
    [
      {
        longitude: -122.3748889,
        latitude: 37.6189722
      },
      {
        longitude: -122.03118,
        latitude: 37.33182
      }
    ].to_json
  end

  def barcode
    {
      message: description,
      format: "PKBarcodeFormatQR",
      messageEncoding: "iso-8859-1"
    }.to_json
  end

  def organization_name
    "medications R us"
  end

  def description
    "Medication: #{name.capitalize} #{Integer(dose)}#{units} daily"
  end

  def logo_text
    "MedicationsRUS"
  end
end
