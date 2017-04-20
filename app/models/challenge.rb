class Challenge < ApplicationRecord
    include Placeholder
    validates_presence_of :name, :description, :main_image, :thumb_image

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(width: '600', height: '400')
        self.thumb_image ||= Placeholder.image_generator(width: '350', height: '200')
    end
end