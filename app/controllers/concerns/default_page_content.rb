module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_filter :set_page_defaults
    end

    def set_page_defaults
        @page_title = "Your Code Challenge Community"
        @seo_keywords = "Challengr code challenges projects blogging programming web development"
    end
end