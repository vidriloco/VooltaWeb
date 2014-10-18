class Admin::PathsController < ApplicationController
  layout 'admin'
  
  before_filter :authenticate_user!
  before_filter :find_path, only: [:update, :destroy]
  
  def update
    if @path.update_attributes(path_params)
      flash[:notice] = I18n.t('paths.update.success')
    else
      flash[:alert] = I18n.t('paths.update.failure')
    end
    
    redirect_to trips_admin_path(params[:path][:trip_id])
  end
  
  def create
    @path = Path.create(path_params)
    if @path.save
      PathTrip.create(path_id: @path.id, trip_id: params[:path][:trip_id])
      flash[:notice] = I18n.t('paths.create.success')
    else
      flash[:alert] = I18n.t('paths.create.failure')
    end
    
    redirect_to trips_admin_path(params[:path][:trip_id])
  end
  
  def destroy
    if @path.destroy
      flash[:notice] = I18n.t('paths.destroy.success')
    else
      flash[:alert] = I18n.t('paths.destroy.failure')
    end
    redirect_to :back
  end
  
  protected
  
  def find_path
    @path = Path.find(params[:id])
  end
  
  def path_params
     params[:path].permit(:name, :details, :thickness, :coordinates_vector, :color)
  end
end