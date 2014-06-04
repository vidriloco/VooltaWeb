class SlideSerializer < ActiveModel::Serializer
  attributes :title, :subtitle, :url, :aligned_to_right, :main_slide, :contrasted, :order
  has_one :image
end
