class CreateLeaveTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :leave_types do |t|
      t.string :name
      t.text :description  # <-- make sure this exists

      t.timestamps
    end
  end
end
