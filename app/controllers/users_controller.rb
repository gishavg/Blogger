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
    if current_user.id == @user.id || current_user.following?(@user)
      @posts = @user.posts.all.order('created_at DESC')
    else
      @posts = @user.posts.all.order('created_at DESC').where('private IS ?', false)
    end
    @p = Post.all.order('created_at DESC').where('private IS ?', false)
    @posts = @posts | @p
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)

  end

  def allfeed
    @user = User.find(params[:user_id])
    @posts = @user.posts.all.order('created_at DESC')
    @p = Post.all.order('created_at DESC').where('private IS ?', false)
    @posts = @posts | @p
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.js
    end
  end

  def personalfeed
    @user = User.find(params[:user_id])
    @p = @user.posts.all.order('created_at DESC')
    @u = @user.following
    @posts = []
    @u.each do |user|
      posts = user.posts.all.order('created_at DESC')
      @posts += posts if posts
    end
    @posts = @posts | @p
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.js
    end
  end

  def lastday

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

  def search
    @user = User.find(params[:user_id])
    q = "%#{params[:key]}%"
    if current_user.id == @user.id || current_user.following?(@user)
      if params[:key][0, 1] == '#'
        @posts = Tag.find_by("name LIKE ?",q).posts
      else
        @posts = @user.posts.all.order('created_at DESC').where("title LIKE ? or body LIKE ?", q, q)
      end
    else
      if params[:key][0, 1] == '#'
        @posts = Tag.find_by("name LIKE ?",q).posts.where('private IS ?', false)
      else
        @posts = @user.posts.all.order('created_at DESC').where('private IS ? and title LIKE ? or body LIKE ?', false, q, q)
      end
    end
    @p = Post.all.order('created_at DESC').where('private IS ? and title LIKE ? or body LIKE ?', false, q, q)
    @posts = @posts.paginate(:page => params[:page], :per_page => 2)
    @posts = @posts | @p
    unless @posts.any?
      search_user(params[:key])
    end
    respond_to do |format|
      format.js
    end
  end

  def search_user(key)
    p key
    p "+++++++++++++++++++++++++++++++++"
    q = "%#{params[:key]}%"
    @user = User.all.where("first_name LIKE ? or last_name LIKE ? or email LIKE ?", q, q, q)
    respond_to do |format|
      format.js
    end
  end
end
