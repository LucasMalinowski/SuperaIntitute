class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :cep
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.integer :ibge_code
      t.integer :municipe_id

      t.timestamps
    end
  end
end
