class PathSerializer < ActiveModel::Serializer
  attributes :name, :details, :coordinates_vector, :color, :thickness
end
