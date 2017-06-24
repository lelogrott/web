class SessionsController < ApplicationController
  def new

  end

  def create
    user = Usuario.find_by(login: params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
    	log_in user
    	redirect_to user
      # Log the user in and redirect to the user's show page.
    else
    	flash[:danger] = 'Invalid email/password combination'
      # Create an error message.
      render 'new'
    end
  end

	def destroy
		log_out
		redirect_to login_path
  	end
end
