class AddFacultyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :faculty, :string
  end
end
