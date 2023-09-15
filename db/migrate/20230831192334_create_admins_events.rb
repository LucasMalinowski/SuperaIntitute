class CreateAdminsEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :admins_events do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
