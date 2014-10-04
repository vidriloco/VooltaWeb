class Admin::UsersController < ApplicationController
  layout 'admin'
  
  before_filter :authenticate_user!
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = I18n.t('users.update.success')
    else
      flash[:alert] = I18n.t('users.update.failure')
    end
    
    redirect_to trips_admin_path(params[:user][:trip_id])
  end
  
  protected
  
  def user_params
     params[:user].permit(:email, :username, :full_name)
  end
end
