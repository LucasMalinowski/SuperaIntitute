class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :company, null: false
      t.string :location, null: false
      t.string :salary, null: false
      t.string :contact, null: false
      t.string :email, null: false
      t.string :benefits, array: true, default: []
      t.text :requirements, null: false
      t.boolean :published, default: false, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :roles, :company
    add_index :roles, :location
    add_index :roles, :published
    add_index :roles, :created_at
    add_index :roles, :benefits, using: 'gin'
  end
end
