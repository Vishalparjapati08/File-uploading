class TestController < ApplicationController

def index
	render json: UserMailer.welcome_email('shivam.j@applify.co').deliver_now

end

end
