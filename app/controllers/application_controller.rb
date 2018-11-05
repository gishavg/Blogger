class ApplicationController < ActionController::Base
  # protect_from_forgery
  # before_action :current_user
  #
  # def current_user
  #   @user = session[:user]
  # end

  def after_sign_in_path_for(resource)
    users_path if resource.class == User
  end
end
