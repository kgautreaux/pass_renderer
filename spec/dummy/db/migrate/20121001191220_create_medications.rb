class CreateMedications < ActiveRecord::Migration
  def self.up
    create_table :medications do |t|
      t.string :name
      t.float :dose
      t.string :units

      t.timestamps
    end
  end

  def self.down
    drop_table :medications
  end
end
