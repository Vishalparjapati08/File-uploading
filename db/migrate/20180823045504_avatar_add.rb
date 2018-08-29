class AvatarAdd < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :avatars, :string
  end
end
