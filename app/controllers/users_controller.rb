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
    @posts = Post.all.order("created_at DESC")
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

  def admin_ban_user
    @user = User.find(params[:id])
  end

  def ban_user
    @user = User.find(params[:id])
    if @user.banned?
      User.where(:id => @user.id).update_all({:banned => false, :ban_period => Time.now - 1.day})
    else
      @userdata = params[:user][:ban_period].to_i
      User.where(:id => @user.id).update_all({:banned => true, :ban_period => @userdata.days.from_now})
    end
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to @user
  end

  # def following
  #   @title = "Following"
  #   @user  = User.find(params[:id])
  #   # @users = @user.following.paginate(page: params[:page])
  #   render partial: 'show_follow'
  # end

  # def followers
  #   @title = "Followers"
  #   @user  = User.find(params[:id])
  #   @users = @user.following?(@user)
  # end
end
