json.extract! project, :id, :title, :subtitle, :description, :main_image, :thumb_image, :source_link, :view_link, :created_at, :updated_at
json.url project_url(project, format: :json)
