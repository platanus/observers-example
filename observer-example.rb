require 'observer'

class Thermometer
  include Observable
  attr_accessor :temperature

  def run
    loop do
      self.temperature = Temperature.fetch
      if changed(true) && count_observers > 0
        notify_observers(self.temperature)
      end
      sleep 0.5
    end
  end
end

class Temperature
  def self.fetch
    rand(-15..50)
  end
end

class WaterFeeder
  attr_accessor :last_time_fed

  def initialize(thermometer)
    thermometer.add_observer(self)
  end

  def update(temperature)
    feed_dog if temperature > 25
  end

  def feed_dog
    if Time.now >= Time.now - 5
      puts "Alimentando al perro."
      last_time_fed = Time.now
    end
  end
end

class TemperatureWarning
  def initialize(thermometer)
    thermometer.add_observer(self, :update_temperature)
  end

  def update_temperature(temperature)
    if temperature < -10 && temperature <= 5
      puts "Temperatura baja: #{temperature}"
    end
    if temperature >= 35 && temperature <= 50
      puts "Temperatura alta: #{temperature}"
    end
  end
end

thermometer = Thermometer.new
WaterFeeder.new(thermometer)
TemperatureWarning.new(thermometer)
thermometer.run
