class RegionSlug < ActiveRecord::Base
  belongs_to :region

  def initialize(region, slug)
    @region = region
    @slug = slug
  end
end
