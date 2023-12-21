class UserController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end

  def create
    @users = User.new(getParams)

    if @users.save
      redirect_to root_path
    else
      render :new
    end

  end

  def update
    @users = User.find(params[:id])

    if @users.update(getParams)
      redirect_to user_index_path , notice: "Update Complete"
    else
      render :edit
    end
  end


  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to root_path
  end

  private

  def getParams
    params.require(:user).permit(:name,:email,:password)
  end

end
