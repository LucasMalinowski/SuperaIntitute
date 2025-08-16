class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :location
      t.string :slug

      t.timestamps
    end
  end
end
