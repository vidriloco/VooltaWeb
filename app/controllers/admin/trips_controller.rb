class Admin::TripsController < ApplicationController
  layout 'admin'
  
  before_filter :find_trip, only: [:show, :edit, :update]
  before_filter :authenticate_user!
  
  def index
    @trip_resources = TripResource.all
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @trip.update_attributes(trip_params)
      redirect_to trips_admin_path(@trip)
    else
      render :action => 'edit'
    end
  end
  
  protected
  
  def trip_params
     params[:trip].permit(:title, :details, :cost, :lang)
  end
  
  def find_trip
    @trip = Trip.find(params[:id])
  end
end
