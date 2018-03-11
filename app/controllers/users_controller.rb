class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
    if current_user
      flash[:notice] = "You cannot sign up, you are currently logged in."
      redirect_to current_user
    end
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:notice] = "Welcome to Who I WAS"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
  end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end	
end
