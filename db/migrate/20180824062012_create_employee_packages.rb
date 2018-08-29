class CreateEmployeePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_packages do |t|
    	t.integer :employee_id
    	t.integer :package_id
      t.timestamps
    end
  end
end
