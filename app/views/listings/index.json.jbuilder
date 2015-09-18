json.array!(@listings) do |listing|
  json.extract! listing, :id, :mls, :address, :price, :sqft, :gui, :target
  json.url listing_url(listing, format: :json)
end
