class BlogPolicy < ApplicationPolicy
    attr_reader :user, :blog
    def initialize(user, blog)
        @user = user
        @post = post
    end
end