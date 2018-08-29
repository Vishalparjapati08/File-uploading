class PackagesController < ApplicationController
	def index
       @packages = Package.all
        render json: @packages
	end	
       
       def new
        @package = Package.new

       end

       def create 
       @package = Package.new(insert_params)

       if @package.save
       	render json:@package
         else
         	render 'new'
             end
    
       end

      private
      
      def insert_params
     params.require(:package).permit(:package_name,:package_price)
      end 

end
