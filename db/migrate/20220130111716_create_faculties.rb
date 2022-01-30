class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :email
      t.date :birth_date
      t.string :designation

      t.timestamps
    end
  end
end
