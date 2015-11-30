json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :category, :interest, :type, :url, :image, :video, :site_name, :user_id
  json.url post_url(post, format: :json)
end
