class TemperatureWarning
  def initialize(temperature)
    puts "⚡️ ⛅️ " * 15
    if temperature < 5 || temperature > 25
      # call api method
      puts "Temperature API: #{temperature} degrees - It's dangerous to go outside!"
    else
      puts "Temperature API: #{temperature} degrees - It's fine to go outside!"
    end
    puts "⚡️ ⛅️ " * 15
  end
end
