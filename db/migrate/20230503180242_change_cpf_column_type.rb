class ChangeCpfColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :municipes, :cpf, :string
    change_column :municipes, :cns, :string
  end
end
