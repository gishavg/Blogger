class UsersController < ApplicationController
  def index
    # if Person.count(:all) == 1 
    if current_user.admin?
      @user = User.all
    else
      @user = User.find_by(params[:email])
    end
  end
end
