class Project < ApplicationRecord
    validates_presence_of :title, :description, :main_image, :thumb_image
end
