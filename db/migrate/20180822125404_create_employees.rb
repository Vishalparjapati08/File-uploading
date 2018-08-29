class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :phone_number
      t.timestamps
    end
  end
end
