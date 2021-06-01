json.articles do
  json.array!(@articles) do |article|
    json.title article.title
    json.url article_path(article)
  end
end

json.content do
  json.array!(@content) do |article|
    json.title article.title
    json.url article_path(article)
  end
end
