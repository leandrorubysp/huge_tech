json.extract! news, :id, :title, :content, :active, :created_at, :updated_at
json.url news_url(news, format: :json)
