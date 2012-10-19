class AddCategoryToMedication < ActiveRecord::Migration
  def self.up
    add_column "medications", "category", "text"
  end

  def self.down
    remove_column "medications", "category"
  end
end
