json.extract! product, :id, :productid, :productname, :price, :discount, :created_at, :updated_at
json.url product_url(product, format: :json)
