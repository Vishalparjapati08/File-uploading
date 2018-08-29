class EmployeesController < ApplicationController

	def index
   @employees = Employee.paginate(:page => params[:page], :per_page => 5) #-- pagination using will gem



#------- tell us the all the employees associated with package id= 1 means small
# @package = Package.find(1)
# @employees = @package.employees   # use employees here not employee bcaz packages has_many employees
# render json: @employees
#--------------------------------------------------------------------------


#------- tell us the all the packages associated with employee id= 1 
# @employee = Employee.find(1)
# @packages = @employee.packages   # use packages here not package bcaz employee has_many packages
# render json: @packages
#--------------------------------------------------------------------------


	end
#--------------------------------------------------#

	def new
   @employee = Employee.new
    # @packages = Package.all
	end	
#--------------------------------------------------#
	def create

     # @employee = Employee.new(insert_param)		
  
    @employee = Employee.new

  @employee.employee_name = params[:employee][:employee_name]
   @employee.email = params[:employee][:email]
  @employee.phone_number = params[:employee][:phone_number]
  @employee.avatars = params[:employee][:image]                 # for multiple file use avatars
 # @employee.avatar = params[:employee][:image]                # for single file use this 

 
 @salary = params[:employee][:salary]

      # packages  =   params[:employee][:packages].map(&:inspect).join(', ')

    packages = params[:employee][:packages]   # packages is an array collection of ids

     
# render json: @employee                                       #only data we filed is show not save in db.
 
if @employee.save

#render json: @employee                                          #  now whole data of record which created just comes from db 

UserMailer.with(employee: @employee).welcome_email.deliver_now    #Sends email to user when user is created

@salary =  Salary.new(salary: @salary)                             # create object of salary table
@employee.salary  = @salary                                       # it insert salary 10000 into salary table 
                                                      #and  employe_id = @employee.id(mylb jo emp create hoga)

# @emp = Employee.find_by(email: params[:email])

packages.each do |package| 
@employee.employee_packages.create!(package_id: package)
end

# the above line insert data into employee_package.. single user have multiple packages...
# @employee means insert package for a particular employee whose value is in @employeee

render json: @employee.packages

else
render 'new'
end

 end 

#---------------------------------#
 def show
@employee = Employee.find(params[:id])          #get all detail of cstomer from his id.

end
#---------------------

   def edit
  @employee = Employee.find(params[:id])
   end

#--------------------------------------------------#
   def update
  @employee = Employee.find(params[:id])
   @employee.employee_name = params[:employee][:employee_name]
  @employee.phone_number = params[:employee][:phone_number]
  @employee.avatars = params[:employee][:image]       \

  if @employee.save
    
    redirect_to employees_path 

   else
    render 'edit'
     end

   end

#--------------------------------------------------#

   def destroy
 
   @employee = Employee.find(params[:id])
   @employee.destroy

 redirect_to employees_path
   end

#--------------------------------------------------#


	private
	def insert_param
     params.require(:employee).permit(:employee_name, :phone_number)
	end	
#--------------------------------------------------#
end




