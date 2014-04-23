json.array!(@repos) do |repo|
  json.extract! repo, :id, :name, :html_url, :description
  json.url repo_url(repo, format: :json)
end
