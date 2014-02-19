json.array!(@fileuploads) do |fileupload|
  json.extract! fileupload, :id, :dbfile
  json.url fileupload_url(fileupload, format: :json)
end
