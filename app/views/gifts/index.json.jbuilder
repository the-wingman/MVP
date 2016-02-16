json.array!(@gifts) do |gift|
  json.extract! gift, :id, :name, :type, :url, :image_url, :description, :comment, :min_price, :max_price, :shipping_available, :shipping_price, :shipping_time, :brand_id, :user_id
  json.url gift_url(gift, format: :json)
end
