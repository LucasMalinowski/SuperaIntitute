class AddCountryCodeToMunicipe < ActiveRecord::Migration[7.0]
  def change
    add_column :municipes, :country_code, :string
  end
end
