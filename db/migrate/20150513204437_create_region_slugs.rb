class CreateRegionSlugs < ActiveRecord::Migration
  def change
    create_table :region_slugs do |t|
      t.string :slug, index: true, null: false
      t.references :region

      t.timestamps
    end

    add_index :region_slugs, :region_id
  end
end
