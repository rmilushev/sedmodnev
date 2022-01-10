json.extract! image, :id, :name, :picture_id, :tag, :created_at, :updated_at
json.url Refile.attachment_url(image, :picture)
json.image_url image_path(image)
json.picture_id image.picture_id
