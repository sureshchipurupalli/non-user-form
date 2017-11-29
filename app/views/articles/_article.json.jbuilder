json.extract! article, :id, :title, :author, :description, :created_at, :updated_at
json.url article_url(article, format: :json)
