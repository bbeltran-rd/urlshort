json.extract! web_address, :id, :title, :full_address, :short_address, :created_at, :updated_at
json.url web_address_url(web_address, format: :json)
