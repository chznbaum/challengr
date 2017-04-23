class Project < ApplicationRecord
    include Placeholder

    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    validates_presence_of :title, :description, :main_image, :thumb_image

    belongs_to :user

    after_initialize :set_defaults

    def slug_candidates
        [
            :title,
            [:title, :subtitle]
        ]
    end

    def set_defaults
        self.main_image ||= Placeholder.image_generator(width: '600', height: '400')
        self.thumb_image ||= Placeholder.image_generator(width: '350', height: '200')
    end
end
