# encoding: utf-8
FactoryGirl.define do
  factory :global_region, class: 'region' do
    id 1
    name "global"
    region_slug { RegionSlug.find_by_slug("global") || FactoryGirl.create(:region_slug, region_id: 1, slug: "global") }
  end

  factory :koeln_region, class: 'region' do
    id 2
    name "Köln"
    region_slug { RegionSlug.find_by_slug("koeln") || FactoryGirl.create(:region_slug, region_id: 2, slug: "koeln") }
  end

  factory :berlin_region, class: 'region' do
    id 3
    name "Berlin"
    region_slug { RegionSlug.find_by_slug("berlin") || FactoryGirl.create(:region_slug, region_id: 3, slug: "berlin") }
  end
end

