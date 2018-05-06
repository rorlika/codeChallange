require 'nokogiri'
require 'open-uri'

class ScrapyService

  def initialize(url)
    @doc = Nokogiri::HTML(open(fix_url(url)))
  rescue ArgumentError => e
    raise 'Cannt scrap this url'
  end

  def extract_content
    group_source_by_tag.each do |_, v|
      v.map! do |c|
        c.content.encode!('UTF-8', 'UTF-8', invalid: :replace).squish
      end
    end
  end

  private

  def group_source_by_tag
    @doc.xpath('//h1', '//h2', '//h3', '//a').group_by(&:name)
  end

  def fix_url(url)
    url.match(/^(https?)/).nil? ? url.gsub('www.', 'http://www.') : url
  end
end
