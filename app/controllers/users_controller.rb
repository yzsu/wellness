class UsersController < ApplicationController
  layout 'user'
  def new
  @user = User.new
  end
  def show
    #@user = User.find(params[:id]) 
	redirect_to "/patient/1"
  end
   def create
    @user = User.new(user_params)
    if @user.save
	  sign_in @user
	  redirect_to "/patient/1"
      #redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
	  params.require(:user).permit(:email, :email_confirmation, :password, 
                                  :password_confirmation, :firstname,:lastname, :hospitalname, :add1, :add2, :add3,
								  :phone1, :phone2, :phone3)	
      								  
    end
end
