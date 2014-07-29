class Api::TripsController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  
  respond_to :json
  
  def show
    @trip = Trip.find_trip_with_id(params[:id])
    if @trip.nil?
      respond_with(@trip, :serializer => TripSerializer, :status => :not_found)
    else
      render json: @trip.precompiled_json
    end
  end
  
  def inventory
    @trips = Trip.all.order(updated_at: :desc).order(available: :desc)
    respond_with(@trips, :each_serializer => TripInventorySerializer)
  end
end