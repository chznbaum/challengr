class PagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def dev
  end

  def help
  end

  def support
  end

  def terms
  end

  def privacy
  end
end
