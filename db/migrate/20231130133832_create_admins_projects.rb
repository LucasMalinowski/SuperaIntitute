class CreateAdminsProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :admins_projects do |t|
      t.string :name
      t.string :description
      t.string :location
      t.date :date
      t.string :contact

      t.timestamps
    end
  end
end
