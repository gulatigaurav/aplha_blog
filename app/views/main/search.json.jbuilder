json.articles do
  json.array!(@articles) do |article|
    json.title article.title
    json.url article_path(article)
  end
end

json.users do
  json.array!(@users) do |user|
    json.email user.email
    json.url user_path(user)
  end
end
