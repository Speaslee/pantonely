class UsersController<ApplicationController

  def profile
    if current_user
    @user = User.find params[:id]
    else
      redirect_to "/"
    end
  end

  def show
    if current_user
    @users = User.all
    else
      redirect_to "/"
    end
  end
