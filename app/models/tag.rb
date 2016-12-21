class Tag < ApplicationRecord
  belongs_to :url

  def self.create_links(elemento,posicao,atributo,url)
    Tag.new(content: elemento[posicao][atributo], url: url, element: '<a>').save
  end

  def self.create_text(elemento,posicao,url, element)
    Tag.new(content: elemento[posicao].text, url: url, element: element).save
  end

end
