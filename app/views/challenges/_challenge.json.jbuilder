json.extract! challenge, :id, :name, :description, :rules, :main_image, :thumb_image, :official_link, :register_link, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)
