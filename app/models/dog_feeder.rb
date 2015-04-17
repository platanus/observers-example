class DogFeeder
  def feed(temperature)
    puts "🐶 " * 30
    if temperature > 10 && temperature < 30
      puts "Feeding the dog!"
    else
      puts "Can't feed the dog, try again later :("
    end
    puts "🐶 " * 30
  end
end
