class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  protected

  def check_admin
    redirect_to root_path, alert: "У Вас не хватает прав для доступа к данной странице!" unless current_user.admin?
  end
end