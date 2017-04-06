json.extract! order, :id, :type, :restaurant, :image, :status, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
