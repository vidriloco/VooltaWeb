class ContentSerializer < ActiveModel::Serializer
  
  private

  def attributes
    defaults = {type: object.kind, order: object.order }
    
    if object.kind=="route_controls"
      defaults
    elsif object.kind=="paragraph"
      defaults.merge({content: object.content})
    elsif object.kind=="legend"
      defaults.merge({details: object.details, icon: object.image.filename, subtitle: object.subtitle, title: object.title })
    elsif object.kind=="photograph"
      defaults.merge({url: object.image.url, caption: object.caption, full_width: object.full_width, image_height: object.image_height })
    elsif object.kind=="poi_table"
      defaults.merge({table_title: object.table_title })
    elsif object.kind=="webview"
      defaults.merge({html_string: object.html_string })
    end
  end

end