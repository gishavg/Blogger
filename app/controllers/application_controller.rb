class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    users_path if resource.class == User
  end
end
