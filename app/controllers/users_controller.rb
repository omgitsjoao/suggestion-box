class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :show]
  before_action :set_user, only: [:edit, :update, :index]

  def login
    if current_user
      redirect_to suggestions_path
    end
  end

  # GET /users/edit
  def edit
  end

  # GET /users
  def index
  end

  # PUT /users
  def update
    if user_params[:new_password]
      @user.password = user_params[:password]
    end
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path, notice: 'User successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :edit}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_user
        @user = User.find(session[:user_id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :new_password)
    end
end
