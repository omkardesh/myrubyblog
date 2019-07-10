class SessionsController < ApplicationController
	def new  #render a form

	end

	def create	#handle form submission and display user in logged in state
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end

	def destroy	#end session and move user to logged out state
		session[:user_id] = nil
		flash[:success] = "You have been logged out"
		redirect_to root_path
	end
end
