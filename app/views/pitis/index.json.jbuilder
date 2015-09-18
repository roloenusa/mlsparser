json.array!(@pitis) do |piti|
  json.extract! piti, :id, :listing_id, :price, :down, :interest, :maturity, :tax, :insurance
  json.url piti_url(piti, format: :json)
end
