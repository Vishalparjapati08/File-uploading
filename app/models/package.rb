class Package < ApplicationRecord
	has_many :employee_packages,dependent: :destroy
	has_many :employees , through: :employee_packages

	validates :package_price,presence: true,:numericality => {:only_integer => true}
	validates :package_name,presence: true,uniqueness: true
end
