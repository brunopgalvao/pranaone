class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      render layout: 'landing_page'
    end
  end

  def help
  end
  
  def about
  end
end
