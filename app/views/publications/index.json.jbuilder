json.array!(@publications) do |publication|
  json.extract! publication, :id, :price, :titulo, :descripcion
  json.url publication_url(publication, format: :json)
end
