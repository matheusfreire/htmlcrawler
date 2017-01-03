require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Url < ApplicationRecord

  def create
    begin
      self.transaction do
        page = Nokogiri::HTML(open(self.path))
        h1 = page.css('h1')
        h2 = page.css('h2')
        h3 = page.css('h3')
        links = page.css('a')
        create_links(links)
        create_titles(h1,'<h1>')
        create_titles(h2,'<h2>')
        create_titles(h3,'<h3>')
        if self.save
          return true
        else
          raise ActiveRecord::Rollback and return false
        end
      end
    rescue Errno::ENOENT, SocketError
      self.erros.add(:path, :not_found, message: "Url not found")
    end
  end

  def update
    begin
      tags = Tag.find_by_url(url: self)
      unless tags.nil?
        tags.each do |t|
          t.destroy
        end
      end
      create
    rescue Errno::ENOENT, SocketError
      self.erros.add(:path, :s, message: "Url not found")
    end
  end

  private
    def create_links(links)
      if links.length > 1
        for i in 0..links.length-1
          Tag.create_links(links, i, "href", self)
        end
      end
    end

    def create_titles(tag, element)
      if tag.length > 1
        for i in 0..tag.length-1
          Tag.create_text(tag, i, self, element)
        end
      end
    end

end
