class CreateAdminsRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :admins_roles do |t|
      t.string :name
      t.string :description
      t.string :company
      t.string :location
      t.string :salary
      t.string :contact
      t.string :email
      t.string :benefits
      t.string :requirements

      t.timestamps
    end
  end
end
