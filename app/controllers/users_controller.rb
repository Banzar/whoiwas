class UsersController < ApplicationController
  before_action :user_logged_in?, only: [:update, :edit]
  before_action :get_available_legacies, only: [:show]

  def index
  	@users = User.paginate(page: params[:page], per_page: 10)
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
    @user.increment!(:legacy_count)
  	if @user.save
      UserMailer.account_activation(@user).deliver_now
  		flash[:notice] = "Welcome to the Legacy Files. Please check your email to activate your account."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user || current_user.super?
      flash[:notice] = "You can only edit your own profile."
      redirect_to @user
  end

    end
  def update
    @user = User.find(params[:id])

    respond_to do |format|
    if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    unless current_user == @user || current_user.admin?
      flash[:notice] = "You can only delete your own profile."
      redirect_to users_url
      return
    end
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted"
    redirect_to users_url
  end

  def show
  	@user = User.find(params[:id])
    @legacy_price =  "$89.99"
    @sale_price = "Sale price: $18.00"
  end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :admin, :legacy_count)
	end	

  def user_logged_in?
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  def get_available_legacies
    @user = User.find(params[:id])
    unless @user.legacy_count.nil?
      @avalaible = @user.legacies.count - @user.legacy_count
    end
  end
end
