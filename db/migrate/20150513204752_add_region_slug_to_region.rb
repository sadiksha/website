class AddMainSlugToRegion < ActiveRecord::Migration
  def change
    change_table :regions do |t|
      t.references :region_slug
    end

    add_index :regions, :region_slug_id
  end
end
