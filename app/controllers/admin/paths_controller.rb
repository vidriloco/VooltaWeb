class Admin::PathsController < ApplicationController
  layout 'admin'
  
  before_filter :authenticate_user!
  
  def update
    @path = Path.find(params[:id])
    if @path.update_attributes(path_params)
      flash[:notice] = I18n.t('paths.update.success')
    else
      flash[:alert] = I18n.t('paths.update.failure')
    end
    
    redirect_to trips_admin_path(params[:path][:trip_id])
  end
  
  protected
  
  def path_params
     params[:path].permit(:name, :details, :thickness, :coordinates_vector, :color)
  end
end