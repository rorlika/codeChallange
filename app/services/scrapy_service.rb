require 'nokogiri'
require 'open-uri'

class ScrapyService

  def initialize(url)
    @doc = Nokogiri::HTML(open(fix_url(url)))
  end

  def extract_content
    group_source_by_tag.each { |_, v| v.map! { |c| c.content.squish }.delete_if(&:blank?) }
  end

  private

  def group_source_by_tag
    @doc.xpath('//h1', '//h2', '//h3', '//a').group_by(&:name)
  end

  def fix_url(url)
    url.match(/^(https?)/).nil? ? url.gsub('www.', 'http://www.') : url
  end
end
