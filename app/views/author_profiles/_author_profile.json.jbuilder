json.extract! author_profile, :id, :admin_id, :name, :image, :description, :enabled, :created_at, :updated_at
json.url author_profile_url(author_profile, format: :json)
