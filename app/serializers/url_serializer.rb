class UrlSerializer < ActiveModel::Serializer
  attributes :id, :path, :links, :titles

  def links
    Tag.where(url: self.object,element: '<a>')
  end

  def titles
    json = Hash.new
    json.merge!({:h1 => Tag.where(url: self.object,element: '<h1>').as_json})
    json.merge!({:h2 => Tag.where(url: self.object,element: '<h2>').as_json})
    json.merge!({:h3 => Tag.where(url: self.object,element: '<h3>').as_json})
    json
  end

end
