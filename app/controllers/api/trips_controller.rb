class Api::TripsController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  
  respond_to :json
  
  def show
    @trip = Trip.find_trip_with_id(params[:id])
    if @trip.nil?
      respond_with(@trip, :serializer => TripSerializer, :status => :not_found)
    else
      respond_with(@trip, :serializer => TripSerializer)
    end
  end
  
  def inventory
    @trips = Trip.all
    respond_with(@trips, :each_serializer => TripInventorySerializer)
  end
end