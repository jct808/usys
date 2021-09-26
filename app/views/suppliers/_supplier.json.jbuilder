json.extract! supplier, :id, :name, :phone, :fax, :address, :sales, :status, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
