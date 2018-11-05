class UsersController < ApplicationController
  def index
    if User.count(:all) == 1
      current_user.update_attribute :admin, true
    end
    if current_user.admin?
      @user = User.all
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def admin_access
    @user = User.find(params[:id])
    if @user.admin?
      @user.update_column(:admin, false)
    else
      @user.update_column(:admin, true)
    end
    redirect_to users_path
  end

  def admin_ban
    @user = User.find(params[:id])
    if @user.banned?
      @user.update_column(:banned, false)
    else
      @user.update_column(:banned, true)
    end
    redirect_to users_path
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to @user
  end


end
