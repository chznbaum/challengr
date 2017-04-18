class Challenge < ApplicationRecord
    validates_presence_of :name, :description, :main_image, :thumb_image
end
