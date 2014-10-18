class Admin::ImagesController < ApplicationController
  layout 'admin'
  
  before_filter :authenticate_user!
  
  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      flash[:notice] = I18n.t('images.update.success')
    else
      flash[:alert] = I18n.t('images.update.failure')
    end
    
    redirect_to trips_admin_path(params[:image][:object_id]) if params[:image][:object_type].eql?("trip")
    redirect_to pois_admin_path(params[:image][:object_id]) if params[:image][:object_type].eql?("poi")
  end
  
  protected
  
  def image_params
     params[:image].permit(:url, :name, :attribution_url, :attribution_info)
  end
end
