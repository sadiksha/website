class CreateRegionSlugs < ActiveRecord::Migration
  def change
    create_table :region_slugs do |t|
      t.string :slug
      t.references :region, index: true

      t.timestamps
    end
  end
end
