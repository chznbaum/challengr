class PagesController < ApplicationController
  def home
    if current_user.is_a?(User)
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def about
    @page_title = "About Challengr"
  end

  def dev
    @page_title = "Developers"
  end

  def help
    @page_title = "Help and FAQ"
  end

  def support
    @page_title = "Support"
  end

  def terms
    @page_title = "Terms of Service"
  end

  def privacy
    @page_title = "Privacy Policy"
  end
end
