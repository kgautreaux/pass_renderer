class AddDirectionsToMedications < ActiveRecord::Migration
  def self.up
    add_column "medications", "directions", "text"
  end

  def self.down
    remove_column "medications", "directions"
  end
end
