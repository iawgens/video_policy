class CreateCountryCodes < ActiveRecord::Migration
  def change
    create_table :country_codes do |t|
      t.string :name
      t.string :iso_code

      t.timestamps
    end
  end
end
