# encoding: utf-8
FactoryGirl.define do
  factory :cowoco_venue, class: 'venue' do
    location "CoWoCo, Gasmotorenfabrik, 3. Etage"
    street "Deutz-Mülheimerstraße 129"
    zipcode "51063"
    city "Köln"
    country "DE"
    latitude 50.9490279
    longitude 6.986784900000001
    region { RegionSlug.find_by_slug("koeln").try(:region) || FactoryGirl.create(:koeln_region) }
  end

  factory :berlin_venue, class: 'venue' do
    location "Ditte is in Berlin, wa?"
    street "Richard-Sorge-Str. 58"
    zipcode "10249"
    city "Berlin"
    country "DE"
    latitude 50.9490279
    longitude 6.986784900000001
    region { RegionSlug.find_by_slug("berlin").try(:region) || FactoryGirl.create(:berlin_region) }
  end
end
