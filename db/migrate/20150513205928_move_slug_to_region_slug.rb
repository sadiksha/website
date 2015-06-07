class MoveSlugToRegionSlug < ActiveRecord::Migration
  def change
    Region.all.each do |region|
      region.region_slug_id = RegionSlug.create!(slug: region.slug, region: region).id
      region.save!
    end
  end
end
