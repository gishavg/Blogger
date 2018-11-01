class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.class == User
      users_path
    # elsif resource.class == User
    #   dashboard_index_path
    end
  end
end
