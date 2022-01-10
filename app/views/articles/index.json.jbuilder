json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :published, :picture, :author_id, :category_id, :golive
  json.url article_url(article, format: :json)
end
