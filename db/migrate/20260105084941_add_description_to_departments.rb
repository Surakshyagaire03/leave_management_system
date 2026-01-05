class AddDescriptionToDepartments < ActiveRecord::Migration[8.1]
  def change
    add_column :departments, :description, :text
  end
end
