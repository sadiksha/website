class WelcomeController < ApplicationController

  def index
    flash.keep
    if session[:region]
      redirect_to region_url(region: session[:region])
    else
      redirect_to "/deutschland"
    end
  end

  def move_to
    region = RegionSlug.find_by_slug(params[:region]).slug

    if region
      session[:region] = region
      redirect_to region_url(region: region)
    else
      redirect_to "/deutschland"
    end
  end

  def deutschland
  end

end
