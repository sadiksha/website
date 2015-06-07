class Region < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :region_organizers
  has_many :organizers, :through => :region_organizers, :source => :user

  has_many :region_slugs
  belongs_to :region_slug

  scope :active, -> { where(active: true) }

  def to_param
    "#{self.id}-#{self.region_slug.slug}"
  end

  def self.find_by_slug(slug)
    RegionSlug.find_by_slug(slug).try(:region)
  end
end
