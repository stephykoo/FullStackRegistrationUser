class UsersController < ApplicationController
  def index; end

  def register
    @user = User.new
    @user.fullname = params[:fullname]
    @user.username = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]
    @user.street = params[:street]
    @user.city = params[:city]
    @user.state = params[:state]
    @user.postalcode = params[:postalcode]
    @user.country = params[:country]
    @user.homephone = params[:phone_number_home]
    @user.cellphone = params[:phone_number_cell]
    @user.workphone = params[:phone_number_work]


    if @user.save
      cookies[:user_id] = @user.id
    else
      render plain: 'Could not save user'
    end
  end

  def login; end

  def profile
    @user = User.find_by(username: params[:username],
                         password: params[:password])

    if @user
      flash.now[:success] = 'Logged in!'
    else
      flash.now[:error] = 'Invalid Credentials'
      render 'login'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :password, :fullname, :street,
      :city, :state, :postalcode, :country, :email)
  end
end
