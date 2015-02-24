class CreateRegionSlugs < ActiveRecord::Migration
  def change
    create_table :region_slugs do |t|
      t.string :slug
      t.references :region, index: true

      t.timestamps
    end

    # Migrate current Region.slug to use RegionSlug
    change_table :regions do |t|
      t.references :regionslug
    end

    Region.find_each do |region|
      region_slug = RegionSlug.new(region, region.slug)
      region_slug.save

      region.update_attribute(:regionslug, region_slug)
    end

    # remove column slug from region model
    remove_column :regions, :slug, :string
  end
end
