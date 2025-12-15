# I forgot how to generate rakes, so I had to Google it and find out `rails g task` exists

namespace :animals do
  task feed_animals: :environment do
    require 'animals/animals'
    require 'foods/foods'

    puts "The dog is going to eat."
    dog = Dog.new

    puts "The dog ate a chicken:"
    dog.eat(Chicken)

    puts "The dog ate cat food:"
    dog.eat(CatFood)

    puts "The dog ate a lemon:"
    dog.eat(Lemon)

    puts "The cat is going to eat."
    cat = Cat.new

    puts "The dog ate milk:"
    cat.eat(Milk)

    puts "The dog ate human food:"
    cat.eat(HumanFood)
  end
end
