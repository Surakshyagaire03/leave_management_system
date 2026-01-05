class AddDescriptionToLeaveTypes < ActiveRecord::Migration[8.1]
  def change
    add_column :leave_types, :description, :text
  end
end
