class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :employee_code
      t.date :join_date
      t.string :status
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
