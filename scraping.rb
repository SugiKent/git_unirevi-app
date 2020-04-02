require 'nokogiri'
require 'open-uri'
 
# 対象のURL
url = "file:///Users/takadanaoki/Desktop/index.html"
 
# Nokogiriで切り分け
doc = Nokogiri::HTML(open(url))
 
doc.css('body > table > tbody > tr:nth-child(7) > td:nth-child(6)').each do |link|
  puts link.content
end