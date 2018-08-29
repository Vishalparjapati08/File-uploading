class Employee < ApplicationRecord
	has_one :salary

	has_many :employee_packages,dependent: :destroy       # for many use (packages) for single use (package)
	has_many :packages , through: :employee_packages



# def self.search(search, page)
#   paginate :per_page => 5, :page => page,
#            :conditions => ['employee_name like ?', "%#{search}%"],
#            :order => 'employee_name'
# end



	mount_uploader :avatar, AvatarUploader   # for single image
    mount_uploaders :avatars, AvatarUploader   # for multiple image 
    serialize :avatars, JSON 

# here we write column_name of table employee_name & phone_number is column in employee table .this is 
# server side validation check before insert data into table to check data must be correct.
# , on: :create   use this is want validation on creatig new record & on: :update when update if want on both 
# write nothing
    validates :employee_name,presence: true,uniqueness: true
	validates :phone_number, presence: true,length: {message:"phone number should be of 10 digits" , is:10 }
end
