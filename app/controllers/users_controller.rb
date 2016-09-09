class UsersController < ApplicationController

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/login'
		else
			@errors = user.errors.full_messages
			redirect_to '/users/new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end