# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach('db/brands.csv', headers: true) do |row|
	Brand.create row.to_hash
end

CSV.foreach('db/tags.csv', headers: true) do |row|
	Tag.create row.to_hash
end

t = ['name', 'brand_id', 'url', 'image_url', 'min_price', 'max_price', 'shipping_available', 'shipping_price', 'shipping_time', 'experience']
CSV.foreach('db/gifts.csv', headers: true, col_sep: "\t") do |row|
	h = {}
	t.each do |v|
		h[v] = row.to_hash[v]
	end
	Gift.create h
end

CSV.foreach('db/gifts.csv', headers: true, col_sep: "\t") do |row|
	h = row.to_hash
	for i in 1..26 do
		GiftTag.create gift_id: Gift.find_by_name(h['name']).id, tag_id: i, value: (10*h[i.to_s].to_f)
	end
end
