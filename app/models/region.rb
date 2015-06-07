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
end
