class AddRationaleToMedication < ActiveRecord::Migration
  def self.up
    add_column "medications", "rationale", "text"
  end

  def self.down
    remove_column "medications", "rationale"
  end
end
