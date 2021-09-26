json.extract! order, :id, :customer, :phone, :address, :total, :shipping_date, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
