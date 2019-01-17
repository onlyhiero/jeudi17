require 'rubygems'
require 'nokogiri'   
require 'open-uri'





def get_townhall_email(townhall_url)
		doc = Nokogiri::HTML(open(townhall_url))
		village = doc.xpath('//html/body/div/main/section[1]/div/div/div/h1')
		email = doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
		h = Hash.new
		h[village.text.to_sym] = email.text

	return h
end


def get_townhall_urls
	townhall_urls = Array.new
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		doc.xpath('//p/a/@href').each do |url|
		townhall_urls << ("http://annuaire-des-mairies.com") + "#{url.text.gsub!(/^\./, "")}"
		end
	return townhall_urls
end



def perform
	tab = []
	townhall_urls = get_townhall_urls
	townhall_urls.each do |i|
		tab << get_townhall_email(i)
	end
	puts tab[0]
end

perform