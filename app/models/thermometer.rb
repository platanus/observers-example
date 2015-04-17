class Thermometer < ActiveRecord::Base
  attr_accessor :temperature

  # after_save :feed_dog
  # after_save :warn_temperature

  def initialize(attributes)
    super
    self.temperature = rand(10..35)
  end

  def calculate_for(country)
    self.temperature = case country
    when 'CL'; rand(10..35)
    when 'AR'; rand(-10..50)
    when 'PE'; rand(10..30)
    else rand(35..50)
    end
    self.save
  end

  # protected

  # def feed_dog

  # end

  # def warn_temperature

  # end
end
