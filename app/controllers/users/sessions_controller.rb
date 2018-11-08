# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.banned? && resource.ban_period >= Time.now
      sign_out resource
      flash[:notice] = 'You are Banned'
      root_path
    else
      super
    end
  end
end
