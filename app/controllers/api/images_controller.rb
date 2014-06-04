class Api::ImagesController < ActionController::Base
  skip_before_filter :verify_authenticity_token
  
  respond_to :json
  
  def show
    @image = Image.find(params[:id])
    respond_with(@image, :serializer => GeneralImageSerializer)
  end
  
  def inventory
    @images = Image.where(:image_type => ["background", "icon"])
    respond_with(@images, :each_serializer => ImageInventorySerializer)
  end
end