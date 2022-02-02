class AddUsernameToFaculty < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties, :username, :string
  end
end
