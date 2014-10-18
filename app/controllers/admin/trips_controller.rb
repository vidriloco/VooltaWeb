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
      flash[:notice] = I18n.t('trips.update.success')
    else
      flash[:alert] = I18n.t('trips.update.failure')
    end
    redirect_to trips_admin_path(@trip)
  end
  
  protected
  
  def trip_params
     params[:trip].permit(:title, :details, :cost, :lang, :complexity, :origin_lon, :origin_lat, :final_lat, :final_lon, :published_on_lite_version, :staging, :available, :distance)
  end
  
  def find_trip
    @trip = Trip.find(params[:id])
    @trip_assigned_paths = @trip.paths
    @trip_unassigned_paths = Path.all-@trip_assigned_paths
    
    @trip_assigned_pois = @trip.pois
    @trip_unassigned_pois = Poi.all-@trip_assigned_pois
  end
end
