class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.string :company
      t.string :location
      t.string :salary
      t.string :contact
      t.string :email
      t.text :requirements
      t.string :benefits
      t.string :slug

      t.timestamps
    end
  end
end
