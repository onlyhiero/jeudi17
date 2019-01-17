
require 'rubygems'
require 'nokogiri'   
require 'open-uri'




def symbol
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	symbol_crypto = Array.new
	doc.xpath('//td[3]').each do |symbol|
		symbol_crypto << symbol.text
	end
	return symbol_crypto
end


def price
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	price_crypto = Array.new
	doc.xpath('//td[5]/a').each do |price|
		
	  price_crypto << price.text
	end
	return price_crypto
end

def perform
	hash_of_symbol_and_price = Hash.new
	z = []

	symbol_crypto = symbol
	price_crypto = price
	z = symbol_crypto.zip(price_crypto).map { |d,m| {symbol:d, price:m}}
	return z[0..5]
end

perform

