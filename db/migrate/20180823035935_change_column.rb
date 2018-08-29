class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :employees, :phone_number , :bigint
  	# change data type of column  
  end
end
