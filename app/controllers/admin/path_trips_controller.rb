class Admin::PathTripsController < ApplicationController

  def destroy
    @path_trip = PathTrip.where(path_id: params[:path_id], trip_id: params[:trip_id])
    unless @path_trip.empty?
      @path_trip.first.destroy
      flash[:notice] = I18n.t('path_trips.destroy.success')
    else
      flash[:alert] = I18n.t('path_trips.destroy.failure')
    end
    redirect_to trips_admin_path(params[:trip_id])
  end
  
  def create
    @path_trip = PathTrip.new(path_id: params[:path_id], trip_id: params[:trip_id])
    if @path_trip.save
      flash[:notice] = I18n.t('path_trips.create.success')
    else
      flash[:alert] = I18n.t('path_trips.create.failure')
    end
    redirect_to trips_admin_path(params[:trip_id])
  end

end