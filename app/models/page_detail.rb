require 'open-uri'

class PageDetail < ActiveRecord::Base

  before_validation :index_page, on: :create
  validates :url, presence: true, format: {with: URI::regexp(%w(http https)), message: "URL must start with http:// or https://"}, uniqueness: true

  private

  def index_page
    content = page_content
    return unless content
    content.css('h1', 'h2', 'h3').each do |h_tag|
      case h_tag.name
      when "h1"
        h1_tags << h_tag.content.strip
      when "h2"
        h2_tags << h_tag.content.strip
      when "h3"
        h3_tags << h_tag.content.strip
      end
    end
  end

  def page_content
    begin
      doc = Nokogiri.HTML(open(url))
    rescue Exception => e
      # puts "Couldn't read \"#{ url }\": #{ e }"
      errors.add(:url, "Problem with the url")
      false
    end
  end
end
