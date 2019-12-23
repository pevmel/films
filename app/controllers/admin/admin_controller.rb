class Admin::AdminController < ApplicationController
  before_action :check_if_admin

  private
  def check_if_admin
    redirect_to root_path, alert: 'Only admins have an access to Admin section.' unless current_user&.is_admin?
  end
end