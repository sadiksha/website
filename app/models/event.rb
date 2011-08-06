class Event < ActiveRecord::Base
  before_save :schedule_to_yaml

  validates_presence_of :name

  # Geocoding
  geocoded_by :address
  after_validation :geocode

  def self.find_in_range(start_date, end_date)
    events = []
    Event.all.each do |event|
      events << event if event.schedule.occurrences_between(start_date, end_date).size > 0
    end
    events
  end

  def self.get_ordered_events(start_date, end_date)
    events = []
    Event.find_in_range(start_date, end_date).each do |event|
      event.schedule.occurrences_between(start_date, end_date).each do |time|
        events << {time: time, event:event}
      end
    end

    events.sort_by {|el| el.first}
  end

  def address
    "#{self.location}, #{self.street}, #{self.zipcode}, #{self.city}"
  end

  def schedule
    if @schedule.nil?
      if !self.schedule_yaml.blank?
        begin
          @schedule = IceCube::Schedule.from_yaml(self.schedule_yaml)
        rescue => e
          # Shit, parsing went wrong
          @schedule = IceCube::Schedule.new(Time.now)
        end
      else
        @schedule = IceCube::Schedule.new(Time.now)
      end
    end
    @schedule
  end

  def schedule=(cube_obj)
    @schedule = cube_obj
    self.schedule_yaml = cube_obj.to_yaml
  end

  private

  def schedule_to_yaml
    self.schedule_yaml = @schedule.to_yaml if !@schedule.nil?
  end

end