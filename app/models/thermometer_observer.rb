class ThermometerObserver < ActiveRecord::Observer
  def after_update(record)
    DogFeeder.new.feed(record.temperature)
    TemperatureWarning.new(record.temperature)
  end
end
