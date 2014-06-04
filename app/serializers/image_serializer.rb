class ImageSerializer < ActiveModel::Serializer
  
  def attributes
    defaults = {attribution_url: object.attribution_url, attribution_info: object.attribution_info}
    if object.image_type == "icon" || object.image_type == "background"
      { filename: object.filename }
    else
      defaults.merge({ url: object.url, updated_at: object.updated_at })
    end
  end
end