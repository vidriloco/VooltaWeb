class Admin::PoiTripsController < ApplicationController

  def destroy
    @poi_trip = PoiTrip.where(poi_id: params[:poi_id], trip_id: params[:trip_id])
    unless @poi_trip.empty?
      @poi_trip.first.destroy
      flash[:notice] = I18n.t('poi_trips.destroy.success')
    else
      flash[:alert] = I18n.t('poi_trips.destroy.failure')
    end
    redirect_to trips_admin_path(params[:trip_id])
  end
  
  def create
    @poi_trip = PoiTrip.new(poi_id: params[:poi_id], trip_id: params[:trip_id])
    if @poi_trip.save
      flash[:notice] = I18n.t('poi_trips.create.success')
    else
      flash[:alert] = I18n.t('poi_trips.create.failure')
    end
    redirect_to trips_admin_path(params[:trip_id])
  end

end