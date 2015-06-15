class UsersController < ApplicationController
  before_action only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy
  before_action :correct_user, only: [:edit, :update]

  # def index
  #   @users = User.all
  # end

  def show
  	@user = User.find(params[:id])
    @user_session_exams = @user.user_session_exams
    
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      
  		flash[:success] = "Successfully. plz login with account that you have created."
  		redirect_to root_path
  	else
      flash[:danger]= "failed"
  		render 'new'
  	end
	end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])   
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "updated successfully!"
      redirect_to @user
    else
      render 'edit'
    end
  end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)			
	end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.role == "admin"
  end
end
