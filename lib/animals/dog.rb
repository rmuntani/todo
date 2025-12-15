require 'foods/foods'
require 'animals/animal'

class Dog
  include Animal

  # I prefer injecting those attributes to make them easier to test and customize,
  # but having those values as constants is acceptable for now.
  def initialize(liked_foods: [DogFood, CatFood, Chicken, HumanFood],
                 noise: "bark")
    @liked_foods = liked_foods
    @noise = noise
  end

  private

  attr_reader :liked_foods, :noise
end
