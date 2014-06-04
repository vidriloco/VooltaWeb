class Api::TrashesController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  
  respond_to :json
  
  def inventory
    @trashes = Trash.all
    respond_with(@trashes, :each_serializer => TrashSerializer)
  end
end