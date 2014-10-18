class Admin::PoisController < ApplicationController
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :find_poi, only: [:update, :destroy, :show]

  def update
    if @poi.update_attributes(poi_params)
      flash[:notice] = I18n.t('pois.update.success')
    else
      flash[:alert] = I18n.t('pois.update.failure')
    end

    redirect_to pois_admin_path(params[:id])
  end

  def create
    @poi = Poi.create(poi_params)
    if @poi.save
      PoiTrip.create(poi_id: @poi.id, trip_id: params[:poi][:trip_id])
      flash[:notice] = I18n.t('pois.create.success')
    else
      flash[:alert] = I18n.t('pois.create.failure')
    end
    
    redirect_to trips_admin_path(params[:poi][:trip_id])
  end

  def destroy
    if @poi.destroy
      flash[:notice] = I18n.t('pois.destroy.success')
    else
      flash[:alert] = I18n.t('pois.destroy.failure')
    end
    redirect_to :back
  end
  
  def show
    @poi_main_images = Image.where(image_type: 'photo')
    @poi_kinds = PoiKind.all
    @poi_modes = Poi.modes
    @poi_categories = PoiCategory.all
  end

  protected

  def find_poi
    @poi = Poi.find(params[:id])
  end

  def poi_params
     params[:poi].permit(:title, :lat, :lon, :details, :listed, :sponsored, :published, :published_on_lite_version, :poi_kind_id, :poi_category_id, :mode, :image)
  end
end