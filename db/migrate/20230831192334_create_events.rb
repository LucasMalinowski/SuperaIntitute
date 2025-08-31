class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.datetime :date, null: false
      t.string :location, null: false
      t.boolean :published, default: false, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :events, :date
    add_index :events, :published
    add_index :events, :created_at
  end
end
