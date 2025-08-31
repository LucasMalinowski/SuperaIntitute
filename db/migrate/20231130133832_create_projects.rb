class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.date :date
      t.string :contact, null: false
      t.boolean :published, default: false, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :projects, :date
    add_index :projects, :published
    add_index :projects, :created_at
  end
end
