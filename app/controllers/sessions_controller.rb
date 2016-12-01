class SessionsController < ApplicationController

	def new 
	
	end

	def create 
		user = User.find_by(email: params[:session][:email])
		
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "logged in #{user.id}"
			redirect_to user_path(user)
		
		else
			flash.now[:danger] = "Incorrect login details"
			render 'new'
		end
		
	end
	
	def destroy 
		session[:user_id] = nil
		flash[:success] = "logged out"
		redirect_to root_path
	end
	
end